provider "aws" {
    region = "${data.terraform_remote_state.vpc.region}"
    access_key = "${var.aws_access_key}"
    secret_key = "${var.aws_secret_key}"
}

terraform {
    backend "s3" {}
}

data "terraform_remote_state" "vpc" {
    backend = "s3"
    config {
        bucket = "${var.s3_tfstate_bucket_name}"
        key = "${var.s3_tfstate_bucket_vpc_key}"
        region = "${var.region}"
    }
}

data "terraform_remote_state" "puppet" {
  backend = "s3"
  config {
    bucket = "${var.s3_tfstate_bucket_name}"
    key    = "${var.s3_tfstate_bucket_puppet_key}"
    region = "${var.region}"
  }
}

module "nat" {
    source = "git@github.com:Burya94/tf_nat.git?ref=dev"
    aws_access_key = "${var.aws_access_key}"
    aws_secret_key = "${var.aws_secret_key}"
    res_nameprefix = "${data.terraform_remote_state.vpc.res_nameprefix}"
    region = "${data.terraform_remote_state.vpc.region}"
    env = "${data.terraform_remote_state.vpc.env}"
    vpc_netprefix = "${data.terraform_remote_state.vpc.vpc_netprefix}"
    pub_sn_netnumber = "${data.terraform_remote_state.vpc.pub_sn_netnumber}"
    pub_sn_netmask = "${data.terraform_remote_state.vpc.pub_sn_netmask}"
    vpc_id = "${data.terraform_remote_state.vpc.vpc_id}"
    pub_sn_azs = "${data.terraform_remote_state.vpc.pub_sn_azs}"
    pub_sn_ids = "${data.terraform_remote_state.vpc.pub_sn_ids}"
    nat_instance_key_name = "${var.instance_key_name}"
    priv_sn_netnumber = "${var.priv_sn_netnumber}"
    priv_sn_netmask = "${var.priv_sn_netmask}"
    puppetmaster_dns = "${data.terraform_remote_state.puppet.private_dns}"
    puppet_ip        = "${data.terraform_remote_state.puppet.private_ip}"
    priv_sn_ids      = "${data.terraform_remote_state.vpc.priv_sn_ids}"
}
