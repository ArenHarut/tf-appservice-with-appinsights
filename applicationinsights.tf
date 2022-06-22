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


resource "azurerm_resource_group" "appservice" {
  name     = var.rgname
  location = var.location
}

resource "azurerm_log_analytics_workspace" "appserviceinsights" {
  name                = var.logaltycswsname
  location            = azurerm_resource_group.appservice.location
  resource_group_name = azurerm_resource_group.appservice.name
  sku                 = var.logaltycswssku
  retention_in_days   = 30
}

resource "azurerm_application_insights" "appserviceinsights" {
  name                = "tf-test-appinsights"
  location            = azurerm_resource_group.appservice.location
  resource_group_name = azurerm_resource_group.appservice.name
  workspace_id        = azurerm_log_analytics_workspace.appserviceinsights.id
  application_type    = "web"
}