variable "project_name" {
  type = string
}
variable "resource_group_name" {
  type = string
}

variable "resource_group_name_db" {
  type = string
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

variable "cosmos_account_name" {
  type        = string
  description = "Name of the Cosmos DB Account."
}

variable "nosql_database_name" {
  type        = string
  description = "Name of the Cosmos DB NoSQL Database (Core SQL API)."
}

variable "nosql_container_name" {
  type        = string
  description = "Name of the Cosmos DB NoSQL Container (Core SQL API)."
}
