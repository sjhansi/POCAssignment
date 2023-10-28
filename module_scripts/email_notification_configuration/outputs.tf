output "sns_arn" {
  value = aws_sns_topic.this.arn
  description = "The ARN of the SNS topic"
}

output "lambda_arn" {
  value = aws_lambda_function.this.arn
  description = "Amazon Resource Name (ARN) identifying your Lambda Function."
}

output "iam_role_arn" {
  value = aws_iam_role.this.arn
  description = "Amazon Resource Name (ARN) specifying the role."
}

output "event_rule_arn" {
  value = aws_cloudwatch_event_rule.this.arn
  description = "The Amazon Resource Name (ARN) of the rule."
}

output "dynamodb_arn" {
  value = aws_dynamodb_table.this.arn
  description = "ARN of the table"
}