variable "lambda_function_arn" {
  description = "The ARN of the Lambda function."
  type        = string
}

variable "stage_name" {
  description = "The stage name for the API Gateway."
  type        = string
  default     = "v1"
}

variable "region" {
  description = "AWS region where resources are deployed."
  type        = string
}
