resource "azurerm_storage_container" "storage_cont" {
  name                  = "vhds"
  storage_account_name  = azurerm_storage_account.storage_account[1].name
  container_access_type = "private"

}
