module "s3" {
  source      = "./s3"
  bucket_name = var.s3_bucket_name
}

module "lambda" {
  source         = "./lambda"
  bucket_name    = var.s3_bucket_name
  s3_bucket_arn  = module.s3.s3_bucket_arn
  lambda_zip_file = "../../app/lambda-approach/function.zip"
}

module "api_gateway" {
  source             = "./api_gateway"
  lambda_function_arn = module.lambda.lambda_function_arn
  region             = var.region
  stage_name         = "v1"
}

output "lambda_function_arn" {
  value = module.lambda.lambda_function_arn
}

output "api_gateway_url" {
  value = module.api_gateway.api_gateway_url
}
