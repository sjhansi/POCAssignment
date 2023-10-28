data "archive_file" "lambda" {
  type        = "zip"
  source_file = "lambda_function.py"
  output_path = "lambda_function.zip"
}

module "email_notification" {
  source = "./module_scripts/email_notification_configuration"

  ###### IAM Role #######
  iam_role_name        = var.iam_role_name
  assume_role_policy   = var.assume_role_policy
  managed_policy_arns  = var.managed_policy_arns
  iam_role_description = var.iam_role_description
  inline_policy        = var.inline_policy
    
  ############ SNS Topic ###########
  sns_topic_name                  = var.sns_topic_name
  sns_topic_subscription_protocol = var.sns_topic_subscription_protocol
  sns_topic_subscription_endpoint = var.sns_topic_subscription_endpoint

  ########## Lambda Function ############
  lambda_filename      = var.lambda_filename
  lambda_function_name = var.lambda_function_name
  lambda_handler       = var.lambda_handler
  source_code_hash     = data.archive_file.lambda.output_base64sha256
  lambda_runtime       = var.lambda_runtime
  environment          = var.environment

  ######## CloudWatch Rule #######
  cloudwatch_event_rule_name        = var.cloudwatch_event_rule_name
  cloudwatch_event_rule_description = var.cloudwatch_event_rule_description
  event_pattern                     = var.event_pattern

  ######### Dynamodb table ##########
  dynamodb_table_name     = var.dynamodb_table_name
  dynamodb_table_hash_key = var.dynamodb_table_hash_key
  attribute               = var.attribute
}

module "security_group" {
  source = "./module_scripts/security_group" 
  
  count = var.create_security_group == true ? 1 : 0
  
  security_group_name        = var.security_group_name
  security_group_description = var.security_group_description
  vpc_id                     = var.vpc_id
}

