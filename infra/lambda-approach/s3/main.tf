resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name

  tags = {
    Name = "http-service-bucket"
  }
}

output "s3_bucket_arn" {
  value = aws_s3_bucket.bucket.arn
}
