provider "aws" {
    region = "${var.region}"
    access_key = "${var.aws_access_key}"
    secret_key = "${var.aws_secret_key}"
}

terraform {
    backend "s3" {}
}

module "vpc" {
    source = "git@github.com:Burya94/tf_vpc.git?ref=dev"
    aws_access_key = "${var.aws_access_key}"
    aws_secret_key = "${var.aws_secret_key}"
    res_nameprefix = "${var.res_nameprefix}"
    env = "${var.env}"
    region = "${var.region}"
    number_of_azs = "${var.number_of_azs}"
    vpc_netnumber = "${var.vpc_netnumber}"
    vpc_netprefix = "${var.vpc_netprefix}"
    pub_sn_netnumber = "${var.pub_sn_netnumber}"
    pub_sn_netmask = "${var.pub_sn_netmask}"
    priv_sn_netnumber = "${var.priv_sn_netnumber}"
    priv_sn_netmask = "${var.priv_sn_netmask}"
    instance_key_name = "${var.instance_key_name}"
    puppet_addr       = "${var.puppet_addr}"

}
