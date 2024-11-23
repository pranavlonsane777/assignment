variable "sg_name" {
  description = "Security Group name"
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
variable "vpc_id" {
  description = "vpc id"
  type = string
}