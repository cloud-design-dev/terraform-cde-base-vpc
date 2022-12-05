variable "region" {
  type        = string
  description = "The IBM Cloud region where VPC and related resources will be deployed. Use the command `ibmcloud is regions` to list available regions."
  default     = "us-south"
}

variable "existing_resource_group" {
  type        = string
  description = "The name of an existing resource group to use. If not specified, a new resource group will be created."
  default     = null
}

variable "owner" {}
