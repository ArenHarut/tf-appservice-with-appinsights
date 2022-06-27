output "instrumentation_key" {
  value = azurerm_application_insights.appinsights.instrumentation_key
}

output "app_id" {
  value = azurerm_application_insights.appinsights.app_id
}

output "connection_string" {
  value     = azurerm_application_insights.appinsights.connection_string
  sensitive = true
}

output "sql_server_fqdn" {
  value = azurerm_sql_server.sqlserver.fully_qualified_domain_name
}

output "dbname" {
  value = azurerm_sql_database.sqldb.name
}

output "sqlserverpass" {
  value = azurerm_sql_server.sqlserver.administrator_login_password
  sensitive = true
}