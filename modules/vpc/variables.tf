variable "address_prefix_management" {
  description = "Address prefix management"
  type        = string
  default     = "auto"
}

variable "prefix" {
  description = "Prefix for all resources"
  type        = string
}

variable "tags" {
  description = "Tags for all resources"
  type        = list(string)
  default     = []
}

variable "region" {
  description = "IBM Cloud Region for resources."
  type        = string
}

variable "resource_group_id" {
  description = "Resource group id"
  type        = string
}

variable "classic_access" {
  description = "Classic access"
  type        = bool
  default     = false
}

variable "address_count" {
  description = "Address count"
  type        = number
  default     = 128
}
