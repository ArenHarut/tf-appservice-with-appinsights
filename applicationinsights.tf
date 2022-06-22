resource "azurerm_log_analytics_workspace" "logaltws" {
  name                = "${var.logaltycswsname}-${var.envname}"
  location            = azurerm_resource_group.appservicesolution.location
  resource_group_name = azurerm_resource_group.appservicesolution.name
  sku                 = var.logaltycswssku
  retention_in_days   = var.logalwsretentiondays
}

resource "azurerm_application_insights" "appinsights" {
  name                = "${var.appinsights}-${var.envname}"
  location            = azurerm_resource_group.appservicesolution.location
  resource_group_name = azurerm_resource_group.appservicesolution.name
  workspace_id        = azurerm_log_analytics_workspace.logaltws.id
  application_type    = var.appinsightsapptype
}