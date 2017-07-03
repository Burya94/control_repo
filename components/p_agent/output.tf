output "public_ip" {
  value = "${module.puppet_agent.public_ip}"
}
output "private_dns" {
  value = "${module.puppet_agent.private_dns}"
}
output "private_ip" {
  value = "${module.puppet_agent.private_ip}"
}
