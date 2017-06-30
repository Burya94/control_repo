output "public_ip" {
  value = "${module.puppet.public_ip}"
}
output "private_dns" {
  value = "${module.puppet.private_dns}"
}
output "private_ip" {
  value = "${module.puppet.private_ip}"
}
