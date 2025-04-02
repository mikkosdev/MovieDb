output "cosmosdb_account_id" {
  description = "The ID of the Cosmos DB Account."
  value       = azurerm_cosmosdb_account.this.id
}

output "cosmosdb_primary_key" {
  description = "Primary key of the Cosmos DB Account."
  value       = azurerm_cosmosdb_account.this.primary_key
  sensitive   = true
}

output "nosql_database_id" {
  description = "The ID of the Cosmos DB NoSQL Database."
  value       = azurerm_cosmosdb_sql_database.this.id
}

output "nosql_container_id" {
  description = "The ID of the Cosmos DB NoSQL Container."
  value       = azurerm_cosmosdb_sql_container.this.id
}
