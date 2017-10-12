output "public_ip" {
  value = "${module.kibana.public_ip}"
}
output "private_dns" {
  value = "${module.kibana.private_dns}"
}
output "private_ip" {
  value = "${module.kibana.private_ip}"
}
