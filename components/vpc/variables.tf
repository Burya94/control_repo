variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "region" {
        default = "us-east-1"
}
variable "env" {}
variable "res_nameprefix" {}
variable "number_of_azs" {}
variable "vpc_netnumber" {
    default = "0.0"
}
variable "vpc_netprefix" {}
variable "pub_sn_netnumber" {}
variable "pub_sn_netmask" {}
variable "priv_sn_netnumber" {}
variable "priv_sn_netmask" {}
variable "instance_key_name" {}
variable "puppet_addr"{
  default = "10"
}
