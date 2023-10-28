output "sg_arn" {
  value = aws_security_group.this.arn
  description = "ARN of the security group."
}