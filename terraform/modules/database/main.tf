resource "azurerm_mssql_server" "sqlserver" {
  name                         = "pacifico-sql-core-demo"
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = "sqladminuser"
  administrator_login_password = "P@ssw0rdSecure2026!"
}

resource "azurerm_mssql_database" "sqldb" {
  name         = "pacifico-db-transaccional"
  server_id    = azurerm_mssql_server.sqlserver.id
  sku_name     = "Basic" # Restricción del sandbox: se usa Basic o S0[cite: 3]
}