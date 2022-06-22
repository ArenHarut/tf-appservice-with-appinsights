terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.10.0"
    }
  }
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}


resource "azurerm_resource_group" "appservicesolution" {
  name     = var.rgname
  location = var.location
}

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
    "APPINSIGHTS_INSTRUMENTATIONKEY"                  = azurerm_application_insights.appinsights.instrumentation_key
    "APPLICATIONINSIGHTS_CONNECTION_STRING"           = azurerm_application_insights.appinsights.connection_string
  }

  connection_string {
    name  = var.asconnectionname
    type  = var.asconnectiontype
    value = var.asconnectioncontent
  }
}