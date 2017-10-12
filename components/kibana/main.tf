provider "aws" {
  region = "${data.terraform_remote_state.vpc.region}"
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
}

terraform {
  backend "s3"{}
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config {
    bucket = "${var.s3_tfstate_bucket_name}"
    key    = "${var.s3_tfstate_bucket_vpc_key}"
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

module "kibana" {
  source           = "git@github.com:Burya94/tf_kibana.git?ref=master"
  key_name         = "${var.instance_key_name}"
  instype          = "${var.instance_type}"
  vpc_id           = "${data.terraform_remote_state.vpc.vpc_id}"
  subnet_id        = "${data.terraform_remote_state.vpc.pub_sn_ids}"
  dns_name         = "${data.terraform_remote_state.puppet.private_dns}"
  puppet_ip        = "${data.terraform_remote_state.puppet.private_ip}"
  priv_sn_netnumber = "${var.priv_sn_netnumber}"
  priv_sn_netmask = "${var.priv_sn_netmask}"
  pub_sn_netmask    = "${var.pub_sn_netmask}"



}
