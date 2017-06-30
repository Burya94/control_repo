variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "region" {
        default = "us-east-1"
}
variable "s3_tfstate_bucket_name" {}
variable "s3_tfstate_bucket_vpc_key" {}
variable "instance_key_name" {}
variable "priv_sn_netnumber" {}
variable "priv_sn_netmask" {}
variable "instance_type" {defautlt = "t2.micro"}
