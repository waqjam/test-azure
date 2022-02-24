variable "prefix" {
  type    = string
  default = "zohra"
}


variable "vnetname" {
  type    = string
  default = "vnet-01"

}


variable "sa_tags" {
  type = map(string)
  default = {
    "environment" = "bootdiagnostic"
    "Name"        = "backend"
  }
}
