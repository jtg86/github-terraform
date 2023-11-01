locals {
  workspaces_ending = terraform.workspace == "default" ? "" : "${terraform.workspace}"

  rg_name = terraform.workspace == "default" ? "${var.rg_name}" : "${var.rg_name}-${local.workspaces_ending}"
  sa_name = terraform.workspace == "default" ? "${var.sa_name}" : "${sa_name}-${local.workspaces_ending}"
}

resource "random_id" "unique_suffix" {
  byte_length = 4
  keepers = {
    workspace = local.workspaces_ending
  }
}

resource "azurerm_resource_group" "rg_webJT" {
  name     = local.rg_name
  location = var.location
}

output "rg_name" {
  value = azurerm_resource_group.rg.name
}

resource "azurerm_storage_account" "sa" {
  name                     = "${lower(local.workspaces_ending)}${random_id.unique_suffix.hex}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  static_website {
    index_document = "index.html"
  }
}

resource "azurerm_storage_container" "website_container" {
  name                  = var.webpage
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = "blob"
}

resource "azurerm_storage_blob" "website_blob" {
  name                   = "index.html"
  storage_account_name   = azurerm_storage_account.sa.name
  storage_container_name = azurerm_storage_container.website_containernummeren.name
  type                   = "Block"
  content_type           = "text/html"
  source_content         = <<CONTENT
<html>
    <body>
        Superheftig webside, laget av JT med Terraform! <br>
        ${upper(local.workspaces_ending)}
    </body>
</html>
CONTENT
}

output "primary_web_endpoint" {
    value = azurerm_storage_account.sa_web_endpoint
  
}
