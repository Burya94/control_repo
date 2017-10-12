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

module "zookeeper" {
  source           = "git@github.com:Burya94/tf_zookeeper.git?ref=dev"
  key_name         = "${var.instance_key_name}"
  instype          = "${var.instance_type}"
  subnet_id        = "${data.terraform_remote_state.vpc.priv_sn_ids}"
  environment      = "${var.env}"
  puppetmaster_dns = "${data.terraform_remote_state.puppet.private_dns}"
  puppet_ip        = "${data.terraform_remote_state.puppet.private_ip}"
  sec_group        = "${data.terraform_remote_state.puppet.sec_group}"
  s3_tfstate_bucket_name = "${var.s3_tfstate_bucket_name}"
  stream_name        = "${var.stream_name}"
  account_id       = "${var.account_id}"
}