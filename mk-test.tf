provider "azurerm" {
  features {}
}

# Use Azure CLI authentication.
provider "databricks" {
  host = var.databricks_host
}
