resource "azurerm_app_service_plan" "appserviceplan" {
  name                = "Server-${var.envname}"
  location            = azurerm_resource_group.appservicesolution.location
  resource_group_name = azurerm_resource_group.appservicesolution.name

  sku {
    tier = var.appserviceplanskutier
    size = var.appserviceplanskusize
  }
}

resource "azurerm_app_service" "web" {
  name                = "web-${var.envname}"
  location            = azurerm_resource_group.appservicesolution.location
  resource_group_name = azurerm_resource_group.appservicesolution.name
  app_service_plan_id = azurerm_app_service_plan.appserviceplan.id

  site_config {
    dotnet_framework_version = var.dotnetfmversion
    scm_type                 = var.scmtype
  }

  app_settings = {
    "APPINSIGHTS_INSTRUMENTATIONKEY"        = azurerm_application_insights.appinsights.instrumentation_key
    "APPLICATIONINSIGHTS_CONNECTION_STRING" = azurerm_application_insights.appinsights.connection_string
  }

depends_on = [
  
]
  connection_string {
    name  = var.asconnectionname
    type  = var.asconnectiontype
    value = "Server=tcp:${azurerm_sql_server.sqlserver.fully_qualified_domain_name},1433;Initial Catalog=${azurerm_sql_database.sqldb.name};Persist Security Info=False;User ID=${var.sqluser};Password=${azurerm_sql_server.sqlserver.administrator_login_password};MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
  }
}