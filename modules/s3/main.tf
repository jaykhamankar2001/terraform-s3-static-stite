# Create S3 bucket 
resource "aws_s3_bucket" "website_bucket" {
  bucket = var.bucket_name
}
resource "aws_s3_bucket" "state_bucket" {
  bucket = var.state_bucket_name
}


# Upload index.html to S3 bucket
resource "aws_s3_bucket_object" "index_html" {
  bucket = aws_s3_bucket.website_bucket.id
  key    = "index.html"
  source = "../website/index.html" # Path to the local index.html file
  etag   = filemd5("../website/index.html")
  content_type = "text/html"  # Setting the MIME type
}


# Upload error.html to S3 bucket
resource "aws_s3_bucket_object" "error_html" {
  bucket = aws_s3_bucket.website_bucket.id
  key    = "error.html"
  source = "../website/error.html" 
  etag   = filemd5("../website/error.html")
  content_type = "text/html"  
}

# S3 Bucket Policy to allow CloudFront Origin Access Identity to read objects
resource "aws_s3_bucket_policy" "website_bucket_policy" {
  bucket = aws_s3_bucket.website_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = "s3:GetObject"
        Effect   = "Allow"
        Resource = "${aws_s3_bucket.website_bucket.arn}/*"
        Principal = {
          CanonicalUser = var.cloudfront_access_identity_id
        }
      }
    ]
  })
}