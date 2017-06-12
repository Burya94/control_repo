output "s3_tfstate_bucket_id" {
    value = ["${aws_s3_bucket.s3_tfstate_bucket.id}"]
}
