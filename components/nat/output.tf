output "vpc_id" {
    value = "${module.nat.vpc_id}"
}
output "res_nameprefix" {
    value = "${module.nat.res_nameprefix}"
}
output "env" {
    value = "${module.nat.env}"
}
output "region" {
    value = "${module.nat.region}"
}
output "vpc_netprefix" {
    value = "${module.nat.vpc_netprefix}"
}
output "pub_sn_netnumber" {
    value = "${module.nat.pub_sn_netnumber}"
}
output "pub_sn_netmask" {
    value = "${module.nat.pub_sn_netmask}"
}
output "nat_inst_sg_ids" {
    value = "${module.nat.nat_inst_sg_ids}"
}
output "nat_inst_sg_names" {
    value = "${module.nat.nat_inst_sg_names}"
}
output "nat_instance_ids" {
    value = "${module.nat.nat_instance_ids}"
}
output "nat_instance_public_ips" {
    value = "${module.nat.nat_instance_public_ips}"
}
output "nat_instance_public_dns" {
    value = "${module.nat.nat_instance_public_dns}"
}
output "priv_sn_rt_ids" {
    value = "${module.nat.priv_sn_rt_ids}"
}
output "priv_sn_netnumber" {
    value = "${module.nat.priv_sn_netnumber}"
}
output "priv_sn_netmask" {
    value = "${module.nat.priv_sn_netmask}"
}
