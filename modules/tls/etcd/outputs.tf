output "etcd_cert_pem" {
  value = "${tls_locally_signed_cert.etcd.cert_pem}"
}

output "etcd_private_key" {
  value = "${tls_private_key.etcd.private_key_pem}"
}

output "etcd_bucket_arn" {
  value = "${aws_s3_bucket.etcdbucket.arn}"
}

output "etcd_bucket_id" {
  value = "${aws_s3_bucket.etcdbucket.id}"
}
