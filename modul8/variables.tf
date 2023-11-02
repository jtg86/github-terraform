variable "rg_name" {
    type = string
    description = "Name of resource group"
    default = "rg-webJT"
  
}

variable "sa_name" {
    type = string
    description = "Name of storage account"
    default = "sawebJT"
  
}

variable "location" {
    type = string
    description = "Location of the resource group"
    default = "westeurope"
  
}

variable "webpage" {
  description = "Name of the webpage"
  type        = string
  default = "minwebside"
}
