# Common

variable "resource_group_name" {
  type        = string
  description = "Name of the Resource Group in which to create the Cosmos DB."
}

variable "environment" {
  type = string
}

variable "location" {
  type = string
}

variable "tags" {
  description = "Tags to set on the resources."
  type        = map(string)
  default     = {}
}

# Cosmos DB specific

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

variable "cosmos_db_offer_type" {
  type        = string
  description = "The SKU/Offer type for Cosmos DB (e.g. Standard)."
  default     = "Standard"
}

variable "cosmos_db_kind" {
  type        = string
  description = "The kind of Cosmos DB (GlobalDocumentDB is used for the NoSQL (Core SQL) API)."
  default     = "GlobalDocumentDB"
}

variable "account_consistency_level" {
  type        = string
  description = "Consistency level of the Cosmos DB account."
  default     = "Session"
}

variable "throughput" {
  type        = number
  description = "The throughput for the NoSQL database and/or container (in RU/s)."
  default     = 400
}

variable "enable_free_tier" {
  type        = bool
  description = "Should we use the free tier?"
  default     = false
}
