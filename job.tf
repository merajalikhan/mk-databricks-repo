variable "job_name" {
  description = "A name for the job."
  type        = string
  default     = "MK Test Job -2"
}

resource "databricks_job" "this" {
  name = var.job_name
  existing_cluster_id = "0426-161834-vhc628e8" #databricks_cluster.this.cluster_id
  notebook_task {
    notebook_path = databricks_notebook.nb2.path
  }
  email_notifications {
    on_success = [ data.databricks_current_user.me.user_name ]
    on_failure = [ data.databricks_current_user.me.user_name ]
  }
  schedule {
    quartz_cron_expression =  "0 30 17 * * ?" #"0 15 25 ? * *" #"0 15 15 ? * *"
    timezone_id = "Europe/London"
  }
}

output "job_url" {
  value = databricks_job.this.url

}
