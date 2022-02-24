resource "azurerm_storage_account" "storage_account" {
  count                    = 2
  name                     = "${random_string.myrandom.id}${count.index}"
  resource_group_name      = azurerm_resource_group.myrg1.name
  location                 = azurerm_resource_group.myrg1.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = var.sa_tags

}



