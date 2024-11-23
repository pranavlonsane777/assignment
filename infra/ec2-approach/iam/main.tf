resource "aws_iam_role" "ec2_role" {
  name               = var.iam_role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = { Service = "ec2.amazonaws.com" },
        Action    = "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Name = var.iam_role_name
  }
}

resource "aws_iam_role_policy" "access_policy" {
  count  = length(var.iam_policies)
  role   = aws_iam_role.ec2_role.name
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = var.iam_policies[count.index].actions
        Resource = var.iam_policies[count.index].resources
      }
    ]
  })
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = var.iam_role_name
  role = aws_iam_role.ec2_role.name
}
