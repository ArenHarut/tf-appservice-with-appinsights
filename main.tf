

resource "azurerm_app_service_plan" "appservice" {
  name                = "appservice-appserviceplan"
  location            = azurerm_resource_group.appservice.location
  resource_group_name = azurerm_resource_group.appservice.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "appservice" {
  name                = "appservice-app-service"
  location            = azurerm_resource_group.appservice.location
  resource_group_name = azurerm_resource_group.appservice.name
  app_service_plan_id = azurerm_app_service_plan.appservice.id

  site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
  }

  app_settings = {
    "APPINSIGHTS_INSTRUMENTATIONKEY"                  = azurerm_application_insights.appserviceinsights.instrumentation_key
    "APPLICATIONINSIGHTS_CONNECTION_STRING"           = azurerm_application_insights.appserviceinsights.connection_string
  }

  connection_string {
    name  = "Database"
    type  = "SQLServer"
    value = "Server=some-server.mydomain.com;Integrated Security=SSPI"
  }
}