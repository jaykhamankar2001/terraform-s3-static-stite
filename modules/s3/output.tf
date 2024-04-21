output "s3_bucket_name" {
  value = aws_s3_bucket.website_bucket.id
}
output "website_bucket_name" {
  value = aws_s3_bucket.website_bucket.bucket_regional_domain_name
}
