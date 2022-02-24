resource "random_id" "res_grp" {
  byte_length = 8
}


output "ran_vm" {
  value = random_id.res_grp.id
}
