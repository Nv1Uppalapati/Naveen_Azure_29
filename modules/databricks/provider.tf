terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.75.0"  
    }
    databricks = {
      source = "databricks/databricks"
      version = "1.0.0" 
    }
  }
}

