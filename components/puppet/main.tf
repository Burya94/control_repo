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

module "puppet" {
  source    = "../../../tf_puppet"
  #source    = "git@github.com:Burya94/tf_puppetmaster.git?ref=dev"
  region    = "${data.terraform_remote_state.vpc.region}"
  key_name  = "puppet"
  instype   = "t2.micro"
  subnet_id = "${data.terraform_remote_state.vpc.vpc_netprefix}.${data.terraform_remote_state.vpc.vpc_netnumber}/${data.terraform_remote_state.vpc.vpc_netmask}"
}
