variable "s3_bucket_name" {
  description = "The name of the S3 bucket to be accessed by the Lambda function."
  type        = string
}

variable "s3_backend_bucket_name" {
  description = "The name of the S3 bucket to store terraform state file."
  type        = string
}

variable "region" {
  description = "AWS region where resources are deployed."
  type        = string
  default     = "us-east-1"
}
