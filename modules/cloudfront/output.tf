output "cloudfront_distribution_id" {
  value = aws_cloudfront_distribution.cloudfront_distribution.id
}
output "cloudfront_access_identity_id" {
  value = aws_cloudfront_origin_access_identity.origin_access_identity.s3_canonical_user_id
}
output "cloudfront_distribution_domain_name" {
  value = aws_cloudfront_distribution.cloudfront_distribution.domain_name
}