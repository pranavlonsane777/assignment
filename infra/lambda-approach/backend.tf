terraform {
  backend "s3" {
    bucket         = "my-http-service-backend-bucket-lonsane"
    key            = "terraform/state/terraform.tfstate"
    region         = "us-east-1"
  }
}