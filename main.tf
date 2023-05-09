terraform {
  required_providers {    
    databricks = {
      source = "databricks/databricks"
    }
  }
}
provider "databricks" {
    host = "https://adb-1710922579126448.8.azuredatabricks.net/"
    token = "dapid24a84b27054a5fccabc962278928be0-3"
}

data "databricks_current_user" "me" {
    
}

/*
resource "databricks_cluster" "shared_autoscaling" {
  cluster_name            = "Shared Autoscaling"
  spark_version           = "6.6.x-scala2.11"
  node_type_id            = "i3.xlarge"
  autotermination_minutes = 20

  autoscale {
    min_workers = 1
    max_workers = 50
  }
}
*/