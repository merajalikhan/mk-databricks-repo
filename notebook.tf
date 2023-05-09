variable "notebook_subdirectory" {
  description = "A name for the subdirectory to store the notebook."
  type        = string
  default     = "Terraform"
}

variable "notebook_filename" {
  description = "The notebook's filename."
  type        = string
}

variable "notebook_language" {
  description = "The language of the notebook."
  type        = string
}

resource "databricks_notebook" "nb1" {
  path     = "${data.databricks_current_user.me.home}/${var.notebook_subdirectory}/${var.notebook_filename}"
  language = var.notebook_language
  source   = "./${var.notebook_filename}"
}

resource "databricks_notebook" "nb2" {
  path     = "${data.databricks_current_user.me.home}/${var.notebook_subdirectory}/mk-test-notebook.py"
  language = var.notebook_language
  source   = "./mk-test-notebook.py"
}

output "notebook_url" {
 value = databricks_notebook.nb2.url
}




