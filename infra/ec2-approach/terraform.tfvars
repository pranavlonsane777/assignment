vpc_name = "assignment_vpc"
vpc_cidr = "10.0.0.0/16"
public_subnet_cidrs = ["10.0.1.0/24"]
private_subnet_cidrs = ["10.0.2.0/24"]
availability_zones = ["us-east-1a", "us-east-1b"]
iam_role_name = "role_for_ec2_instance"
ami_id = "ami-0866a3c8686eaeeba"
key_name = "assignment_vm_key"
s3_bucket_name = "my-http-service-ec2-bucket-lonsane"
ingress_rules = [
  {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },{
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  },{
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }
]
iam_policies = [
  "s3:ListBucket",
  "s3:GetObject",
  "secretsmanager:GetSecretValue"
]
instance_type = "t2.micro"
sg_name = "web_sg"
region = "us-east-1"