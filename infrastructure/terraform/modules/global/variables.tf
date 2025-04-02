variable "resource_group_name" {
  type        = string
  description = "Name of the Resource Group in which to create the global resources."
}

variable "environment" {
  type = string
}

variable "location" {
  type = string
}

variable "location_short" {
  type = string
}

variable "tags" {
  description = "Tags to set on the resources."
  type        = map(string)
  default     = {}
}
