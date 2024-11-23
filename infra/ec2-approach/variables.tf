variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
#   default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
#   default     = ["10.0.1.0/24"]
}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
#   default     = ["10.0.2.0/24"]
}

variable "availability_zones" {
  description = "List of availability zones for subnets"
  type        = list(string)
#   default     = ["us-east-1a", "us-east-1b"]
}

variable "iam_role_name" {
  description = "IAM role name for the instance"
  type        = string
}
variable "iam_policies" {
  description = "List of IAM policies to attach"
  type        = list(string)
#   default = [ "abc" ]
}
# variable "secret_name" {
#   description = "Secrets Manager name"
#   type        = string
# }

# variable "secret_value" {
#   description = "Secrets Manager value"
#   type        = map(string)
# }
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

variable "s3_bucket_name" {
  description = "The name of the S3 bucket to be accessed by the EC2."
  type        = string
}
variable "ingress_rules" {
  description = "Ingress rules for the security group"
  type        = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "sg_name" {
  description = "Security Group name"
  type        = string
}
variable "region" {
  description = "name of region"
  type = string
}
variable "vpc_id" {
  type = string
  description = "vpc id"
}