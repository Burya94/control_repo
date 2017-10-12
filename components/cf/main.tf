provider "aws" {
  region     = "us-east-1"
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
}

module "cloudfront" {
  source = "git::ssh://git@git.cm-elsevier.com:8000/cm-tf/cm-terraform-rxcloud-front.git"

  colour              = "${var.colour}"
  aliases             = "${var.aliases}"
  cloudfront_name     = "${var.cloudfront_name}"
  global_product      = "${var.global_product}"
  default_certificate = "${var.default_certificate}"
  comment             = "${var.comment}"

  #first origin
  first_path        = "${var.first_path}"
  first_origin_id   = "${var.first_origin_id}"
  first_domain_name = "${var.first_domain_name}"

  #second origin
  second_path        = "${var.second_path}"
  second_origin_id   = "${var.second_origin_id}"
  second_domain_name = "${var.second_domain_name}"

  #third origin
  s3_origin_id   = "${var.s3_origin_id}"
  s3_domain_name = "${var.s3_domain_name}"

  #default behavior
  default_behavior_origin_id = "${var.default_behavior_origin_id}"

  #first behavior
  first_behavior_path_pattern    = "${var.first_behavior_path_pattern}"
  first_behavior_origin_id       = "${var.first_behavior_origin_id}"
  first_behavior_allowed_methods = "${var.first_behavior_allowed_methods}"
  first_behavior_headers         = "${var.first_behavior_headers}"
  first_behavior_query_string    = "${var.first_behavior_query_string}"
  first_behavior_forward_cookies = "${var.first_behavior_forward_cookies}"

  #second behavior
  second_behavior_path_pattern    = "${var.second_behavior_path_pattern}"
  second_behavior_origin_id       = "${var.second_behavior_origin_id}"
  second_behavior_headers         = "${var.second_behavior_headers}"
  second_behavior_query_string    = "${var.second_behavior_query_string}"
  second_behavior_forward_cookies = "${var.second_behavior_forward_cookies}"

  #third behavior
  third_behavior_path_pattern    = "${var.third_behavior_path_pattern}"
  third_behavior_origin_id       = "${var.third_behavior_origin_id}"
  third_behavior_allowed_methods = "${var.third_behavior_allowed_methods}"
  third_behavior_headers         = "${var.third_behavior_headers}"
  third_behavior_query_string    = "${var.third_behavior_query_string}"
  third_behavior_forward_cookies = "${var.third_behavior_forward_cookies}"

  #fourth behavior
  fourth_behavior_path_pattern    = "${var.fourth_behavior_path_pattern}"
  fourth_behavior_origin_id       = "${var.fourth_behavior_origin_id}"
  fourth_behavior_allowed_methods = "${var.fourth_behavior_allowed_methods}"
  fourth_behavior_headers         = "${var.fourth_behavior_headers}"
  fourth_behavior_query_string    = "${var.fourth_behavior_query_string}"
  fourth_behavior_forward_cookies = "${var.fourth_behavior_forward_cookies}"
}
