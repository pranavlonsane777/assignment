variable "iam_role_name" {
  description = "Name of the IAM role"
  type        = string
}

variable "iam_policies" {
  description = "IAM policy statements to attach to the role"
  type        = list(object({
    actions   = list(string)
    resources = list(string)
  }))
}
