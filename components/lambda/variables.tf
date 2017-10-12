variable "aws_access_key" {}
variable "aws_secret_key" {}

variable "region" {
  default = "us-east-1"
}

variable "s3_tfstate_bucket_name" {}
variable "s3_tfstate_bucket_vpc_key" {}

variable "metric_name" {
  default = "Zookeeper_cluster_status"
}

variable "capacity_of_cluster" {
  default = "3"
}

variable "asg_name" {
  default = "terraasg_test"
}
variable "api_token" {
    default = "L-eDyAimGaScv6ssGrNf"
}
variable "service_key" {
    default = "d3c1f06a74014ac2a54461e24f0faa03"
}
variable "subdomain"{
    default = "mytestsiteforaws"
}
