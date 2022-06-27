resource "azurerm_sql_server" "sqlserver" {
  name                         = "${var.az_sql_server_name}-${var.envname}"
  resource_group_name          = azurerm_resource_group.appservicesolution.name
  location                     = azurerm_resource_group.appservicesolution.location
  version                      = var.sqlversion
  administrator_login          = var.sqluser
  administrator_login_password = random_password.password.result

  tags = {
    environment = var.envname
  }
}

resource "azurerm_storage_account" "sqlserverstorage" {
  name                     = "${var.az_sql_storage_name}-${var.envname}"
  resource_group_name      = azurerm_resource_group.appservicesolution.name
  location                 = azurerm_resource_group.appservicesolution.location
  account_tier             = var.az_sql_storage_tier
  account_replication_type = var.az_sql_storage_replication
}

resource "azurerm_sql_database" "sqldb" {
  name                = "${var.az_sql_db_name}-${var.envname}"
  resource_group_name = azurerm_resource_group.appservicesolution.name
  location            = azurerm_resource_group.appservicesolution.location
  server_name         = azurerm_sql_server.sqlserver.name



  tags = {
    environment = var.envname
  }
}

