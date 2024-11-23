variable "bucket_name" {
  description = "The name of the S3 bucket."
  type        = string
}

variable "s3_bucket_arn" {
  description = "The ARN of the S3 bucket."
  type        = string
}

variable "lambda_zip_file" {
  description = "The ZIP file for the Lambda function."
  type        = string
}
