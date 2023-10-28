output "sns_arn" {
  value = module.email_notification.sns_arn
  description = "The ARN of the SNS topic"
}

output "lambda_arn" {
  value = module.email_notification.lambda_arn
  description = "Amazon Resource Name (ARN) identifying your Lambda Function."
}

output "iam_role_arn" {
  value = module.email_notification.iam_role_arn
  description = "Amazon Resource Name (ARN) specifying the role."
}

output "event_rule_arn" {
  value = module.email_notification.event_rule_arn
  description = "The Amazon Resource Name (ARN) of the rule."
}

output "sg_arn" {
  value = var.create_security_group == true ? module.security_group.*.sg_arn : null
  description = "ARN of the security group."
}

output "dynamodb_arn" {
  value = module.email_notification.dynamodb_arn
  description = "ARN of the table"
}