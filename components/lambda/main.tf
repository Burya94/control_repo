provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.region}"
}

data "terraform_remote_state" "vpc" {
  backend = "s3"

  config {
    bucket = "${var.s3_tfstate_bucket_name}"
    key    = "${var.s3_tfstate_bucket_vpc_key}"
    region = "${var.region}"
  }
}

module "lambda" {
  source              = "git::ssh://git@gitbud.epam.com/Artem_Buria/tf_lambda.git?ref=dev"
  subnets             = ["${data.terraform_remote_state.vpc.priv_sn_ids}"]
  sec_groups          = ["${data.terraform_remote_state.vpc.def_sg}"]
  metric_name         = "${var.metric_name}"
  capacity_of_cluster = "${var.capacity_of_cluster}"
  asg_name            = "${var.asg_name}"
  api_token           = "${var.api_token}"
  service_key         = "${var.service_key}"
  subdomain           = "${var.subdomain}"
}
