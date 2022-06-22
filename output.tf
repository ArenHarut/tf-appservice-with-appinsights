output "instrumentation_key" {
  value = azurerm_application_insights.appserviceinsights.instrumentation_key
}

output "app_id" {
  value = azurerm_application_insights.appserviceinsights.app_id
}

output "connection_string" {
  value = azurerm_application_insights.appserviceinsights.connection_string
  sensitive   = true
}