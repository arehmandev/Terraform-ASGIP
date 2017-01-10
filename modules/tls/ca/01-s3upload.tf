resource "aws_s3_bucket" "certauthbucket" {
  bucket = "${var.bucketname}"
  acl    = "private"

  tags {
    Name        = "Myyaabdulbucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_object" "object" {
  depends_on = ["aws_s3_bucket.certauthbucket"]
  bucket     = "${aws_s3_bucket.certauthbucket.bucket}"
  key        = "new_object_key"
  source     = "${path.module}/Files/${var.capem}"
  kms_key_id = "${aws_kms_key.examplekms.arn}"
}

resource "aws_kms_key" "examplekms" {
  description             = "KMS key 1"
  deletion_window_in_days = 7
}