output "vpc_id" {
    value = "${module.vpc.vpc_id}"
}
output "vpc_igw_id" {
    value = "${module.vpc.vpc_igw_id}"
}
output "vpc_def_rt_id" {
    value = "${module.vpc.vpc_def_rt_id}"
}
output "pub_sn_ids" {
    value = "${module.vpc.pub_sn_ids}"
}
output "pub_sn_azs" {
    value = "${module.vpc.pub_sn_azs}"
}
output "res_nameprefix" {
    value = "${module.vpc.res_nameprefix}"
}
output "env" {
    value = "${module.vpc.env}"
}
output "region" {
    value = "${module.vpc.region}"
}
output "vpc_netmask" {
    value = "${module.vpc.vpc_netmask}"
}
output "vpc_netnumber" {
    value = "${var.vpc_netnumber}"
}
output "vpc_netprefix" {
    value = "${module.vpc.vpc_netprefix}"
}
output "pub_sn_netnumber" {
    value = "${module.vpc.pub_sn_netnumber}"
}
output "pub_sn_netmask" {
    value = "${module.vpc.pub_sn_netmask}"
}
output "priv_sn_ids" {
  value = "${module.vpc.priv_sn_ids}"
}
output "pub_net" {
  value = "${module.vpc.pub_net}"
}
output "priv_sn_azs" {
    value = "${module.vpc.priv_sn_azs}"
}
