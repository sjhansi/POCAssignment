resource "aws_cloudwatch_event_rule" "this" {
  name          = var.cloudwatch_event_rule_name
  description   = var.cloudwatch_event_rule_description

  event_pattern = file(var.event_pattern)
}

resource "aws_cloudwatch_event_target" "example" {
  arn        = aws_lambda_function.this.arn
  rule       = aws_cloudwatch_event_rule.this.id
  depends_on = [ aws_lambda_function.this ]
}