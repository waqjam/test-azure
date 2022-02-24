output "pub-ip" {
  value = azurerm_public_ip.web_linuxvm_publicip.*.ip_address
}
