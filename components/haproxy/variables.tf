variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "region" {
  default = "us-east-1"
}
variable "s3_tfstate_bucket_name" {}
variable "s3_tfstate_bucket_vpc_key" {}
variable "s3_tfstate_bucket_puppet_key" {}
variable "instance_key_name" {}
variable "instance_type" {
  default = "t2.micro"
}
variable "stream_name" {
    default = "els-srch-vi-test"
}
variable "account_id" {}
variable "table_name"{
    default = "dynamo_test"
}
