resource "aws_s3_bucket" "logging_bucket" {
  bucket = "${var.namespace}-logging-bucket-lacework"
  acl    = var.acl
}