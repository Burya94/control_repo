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

module "asg_elb" {
  source = "git@github.com:Burya94/tf_asg_lb.git"
  env = "${data.terraform_remote_state.vpc.env}"
  av_zones = "${data.terraform_remote_state.vpc.pub_sn_azs}"
  vpc_id   = "${data.terraform_remote_state.vpc.vpc_id}"


}
