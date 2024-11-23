variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "key_name" {
  description = "Key pair name"
  type        = string
}

variable "security_group_id" {
  description = "Security group ID"
  type        = string
}

variable "iam_instance_profile" {
  description = "IAM instance profile name"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet in which to launch the instance"
  type        = string
}
variable "bucket_name" {
  description = "s3 bucket name"
  type = string
}