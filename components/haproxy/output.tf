output "public_ip" {
  value = "${module.haproxy.public_ip}"
}

output "private_dns" {
  value = "${module.haproxy.private_dns}"
}

output "private_ip" {
  value = "${module.haproxy.private_ip}"
}

output "public_dns" {
  value = "${module.haproxy.public_dns}"
}
