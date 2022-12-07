variable "region" {
  type        = string
  description = "The IBM Cloud region where the VPC will be created."
}

variable "prefix" {
  type        = string
  description = "The prefix that will be used for all resources as part of this lab."
}

variable "owner" {}

#####################################################
# Variables with Default Parameters
#####################################################
variable "default_address_prefix" {
  type        = string
  description = "Indicates whether a default address prefix should be automatically created for each zone in this VPC."
  default     = "auto"
}

variable "classic_access" {
  type        = bool
  description = "Indicates whether the VPC supports Classic access. Default is false."
  default     = false
}

variable "number_of_addresses" {
  type        = number
  description = "The number of IPv4 addresses to allocate for this subnet."
  default     = 256
}

variable "existing_resource_group" {
  type        = string
  description = "The name of an existing resource group to use. If not specified, a new resource group will be created."
  default     = null
}

