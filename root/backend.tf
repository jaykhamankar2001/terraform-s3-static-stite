terraform {
  backend "s3" {
   bucket = "s3-state-backend-1"
   dynamodb_table = "state-lock"
   key = "global/mystatefile/terraform.tfstate"
   region = "us-west-2"
 }
}