terraform {
  required_providers {
    data_bricks = {
        source = "databrickslabs/databricks"
        version = "0.3.1"
    }
  }
}

provider "databricks" {
    azure_workspace_resource_id = azure_databricks_workspace.workspace.id
    azure_client_id = "2c754c8a-3971-4c72-892f-e6c4eb0eb67c"
    azure_clinet_secret = "LXJ8Q~8xiratJFMrdDnJ-WzfIRbI6cPMdGfZCaXr"
    azure_tenant_id = "20daed00-4d24-4bb4-9072-54966122bed5"
}


provider "azurerm" { 
    features {}
    client_id = "2c754c8a-3971-4c72-892f-e6c4eb0eb67c"
    clinet_secret = "LXJ8Q~8xiratJFMrdDnJ-WzfIRbI6cPMdGfZCaXr"
    tenant_id = "20daed00-4d24-4bb4-9072-54966122bed5"
    subscription_id = "bbf05370-7c0e-4f8c-a2c5-c51ead4d008f"

}
