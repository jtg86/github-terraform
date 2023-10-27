variable "rg_backend_name" {
    type = string
    description = "Navnet til ressursgruppen backend"
}

variable "rg_backend_location" {
    type = string
    description = "Lokasjonen til ressursgruppen backend"
}

variable "sa_backend_name" {
    type = string
    description = "Navn til storage account "
}

variable "sc_backend_name" {
    type = string
    description = "Navn til storage container"
}

variable "kv_backend_name" {
    type = string
    description = "Navn til keyvault" 
}

variable "sa_backend_accesskey_name" {
    type = string
    description = "Navn til storage account access key for backend"
  
}