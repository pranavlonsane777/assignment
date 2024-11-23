module "vpc" {
  source     = "./vpc"
  vpc_name   = var.vpc_name
  cidr_block = var.vpc_cidr
}

module "subnets" {
  source              = "./subnets"
  vpc_id              = module.vpc.vpc_id
  route_table_id      = module.vpc.route_table_id
  vpc_name            = var.vpc_name
  public_subnet_cidrs = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones  = var.availability_zones
}

module "security_group" {
  source        = "./security_group"
  sg_name       = var.sg_name
  ingress_rules = var.ingress_rules
  vpc_id   = module.vpc.vpc_id
}
module "iam" {
  source           = "./iam"
  iam_role_name    = var.iam_role_name
  iam_policies     = [
    {
      actions   = ["s3:ListBucket", "s3:GetObject", "secretsmanager:GetSecretValue"]
      resources = ["*"]
    }
  ]
}

# module "secret_manager" {
#   source       = "./secret_manager"
#   secret_name  = var.secret_name
#   secret_value = var.secret_value
# }

module "ec2" {
  source               = "./ec2"
  ami_id               = var.ami_id
  instance_type        = var.instance_type
  key_name             = var.key_name
  security_group_id    = module.security_group.security_group_id
  iam_instance_profile = module.iam.iam_instance_profile
  subnet_id            = element(module.subnets.public_subnet_ids, 0)
  bucket_name = var.s3_bucket_name
}
module "s3" {
  source = "./s3"
  bucket_name  = var.s3_bucket_name
}

