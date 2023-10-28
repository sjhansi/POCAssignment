resource "aws_lambda_function" "this" {
  filename         = var.lambda_filename
  function_name    = var.lambda_function_name
  role             = aws_iam_role.this.arn
  handler          = var.lambda_handler
  source_code_hash = var.source_code_hash
  runtime          = var.lambda_runtime

  dynamic "environment" {
    for_each = var.environment != [] ? var.environment : []
    content {
      variables = lookup(environment.value,"variables")
    }
  }
}

resource "aws_lambda_permission" "this" {
    statement_id  = "AllowExecutionFromCloudWatch"
    action        = "lambda:InvokeFunction"
    function_name = aws_lambda_function.this.arn
    principal     = "events.amazonaws.com"
    source_arn    = aws_cloudwatch_event_rule.this.arn
}