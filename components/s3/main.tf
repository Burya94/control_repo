provider "aws" {
    region = "${var.els_srch_vi_region}"
    access_key = "${var.els_srch_vi_aws_access_key}"
    secret_key = "${var.els_srch_vi_aws_secret_key}"
}

resource "aws_s3_bucket" "s3_tfstate_bucket" {
    bucket = "${var.s3_tfstate_bucket_name}"
    acl = "private"
    versioning {
        enabled = true
    }
}
