resource "azurerm_mssql_server" "sqlserver" {
  for_each = var.rg_map
  name                         = each.value.name_sql
  resource_group_name          = each.value.resource_group_name
  location                     = each.value.location
  version                      = "12.0"
  administrator_login          = "sqladminstrator"
  administrator_login_password = "Thisisadog11"
  minimum_tls_version          = "1.2"

}

resource "azurerm_mssql_database" "sqldatabase" {
  for_each = var.rg_map
  name           = each.value.name_db
  server_id      = azurerm_mssql_server.sqlserver[each.key].id

}
