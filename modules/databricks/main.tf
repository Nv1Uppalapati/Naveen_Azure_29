# workspace
resource "azure_resource_group" "resourcegroup" {
    location = "us east1"
    name = "data_bricks"  

}


resource "azure_databricks_workspace" "workspace" {
    location = azure_resource_group.resourcegroup.location
    name = "azureDB"
    resource_group_name = azure_resource_group.resource.name
    sku = "standard" 

}

data "databricks_node_type" "smallest" {
    depends_on = [azure_databricks_workspace.workspace]
    local_disk = true
}

data "databricks_spark_version" "latest_lts" {
    depends_on = [azure_databricks_workspace.workspace]
    long_term_support = true
}

resource "databricks-instance_pool" "pool"{
    instance_pool_name = "DBAZUREPOOL"
    min_idle_instance = 0 
    max_capacity = 10
    node_type_id = data.databricks_node_type.smallest.id

    idle_instance_autotermination_minutes = 10

}


resource "databricks_cluster" "shared_autoscaling" {
    depends_on = [azure_databricks_workspace.workspace]
    instance_pool_id = databricks_instance_pool.pool.id
    cluster_name            = "Shared Autoscaling"
    spark_version           = data.databricks_spark_version.latest_lts.id
    node_type_id            = data.databricks_node_type.smallest.id
    autotermination_minutes = 20
    autoscale {
        min_workers = 1
        max_workers = 5    

    }
    spark_conf = {
        "spark.databricks.io.cache.enabled" : true

    }

    custom_tags = {
        "createdby" = "donebyinfrateam"
        
    }

}