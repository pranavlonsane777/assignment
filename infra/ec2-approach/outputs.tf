output "ec2_instance_id" {
  value = module.ec2.instance_id
}

output "security_group_id" {
  value = module.security_group.security_group_id
}

output "iam_role_arn" {
  value = module.iam.iam_role_arn
}
