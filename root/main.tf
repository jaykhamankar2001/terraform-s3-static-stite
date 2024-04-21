module "s3" {
     source = "../modules/s3"
     cloudfront_access_identity_id = module.cloudfront.cloudfront_access_identity_id
     
}

module "cloudfront" {
    source = "../modules/cloudfront"
    bucket_name = module.s3.s3_bucket_name
    website_bucket_name = module.s3.website_bucket_name
}

module "dynamodb" {
     source = "../modules/dynamodb"
  
}
output "cloudfront_distribution_domain_name" {
  value = module.cloudfront.cloudfront_distribution_domain_name
}