resource "aws_api_gateway_rest_api" "http_service_api" {
  name = "http_service_api"
}

resource "aws_api_gateway_resource" "http_service_resource" {
  rest_api_id = aws_api_gateway_rest_api.http_service_api.id
  parent_id   = aws_api_gateway_rest_api.http_service_api.root_resource_id
  path_part   = "list-bucket-content"
}

resource "aws_api_gateway_method" "http_service_get" {
  rest_api_id   = aws_api_gateway_rest_api.http_service_api.id
  resource_id   = aws_api_gateway_resource.http_service_resource.id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "http_service_integration" {
  rest_api_id             = aws_api_gateway_rest_api.http_service_api.id
  resource_id             = aws_api_gateway_resource.http_service_resource.id
  http_method             = aws_api_gateway_method.http_service_get.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = "arn:aws:apigateway:${var.region}:lambda:path/2015-03-31/functions/${var.lambda_function_arn}/invocations"
}

resource "aws_api_gateway_stage" "http_service_stage" {
  stage_name    = var.stage_name
  rest_api_id   = aws_api_gateway_rest_api.http_service_api.id
  deployment_id = aws_api_gateway_deployment.http_service_deployment.id
}

resource "aws_api_gateway_deployment" "http_service_deployment" {
  rest_api_id = aws_api_gateway_rest_api.http_service_api.id

  depends_on = [
    aws_api_gateway_integration.http_service_integration
  ]
}

output "api_gateway_url" {
  value = "https://${aws_api_gateway_rest_api.http_service_api.id}.execute-api.${var.region}.amazonaws.com/${var.stage_name}"
}
