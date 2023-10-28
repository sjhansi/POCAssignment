###### IAM Role #######
variable "iam_role_name" {
  type = string
  description = "Friendly name of the role. If omitted, Terraform will assign a random, unique name. See IAM Identifiers for more information."
}

variable "assume_role_policy" {
  type = string
  description = "Policy that grants an entity permission to assume the role."
}

variable "managed_policy_arns" {
  type = list(string)
  description = "Set of exclusive IAM managed policy ARNs to attach to the IAM role. If this attribute is not configured, Terraform will ignore policy attachments to this resource. "
}

variable "iam_role_description" {
  type = string
  description = "Description of the role."
}

variable "inline_policy" {
  type = list(object({
    name = string
    policy = string
  }))
  default = []
  description = "Configuration block defining an exclusive set of IAM inline policies associated with the IAM role. "
}

############ SNS Topic ###########
variable "sns_topic_name" {
  type = string
  description = "The name of the topic. "
}

variable "sns_topic_subscription_protocol" {
  type = string
  description = "Protocol to use."
  default = "email"
}

variable "sns_topic_subscription_endpoint" {
  type = string
  description = "Delivers messages via SMTP. endpoint is an email address."
}
########## Lambda Function ############

variable "lambda_filename" {
  type = string
  description = "Path to the function's deployment package within the local filesystem. Exactly one of filename, image_uri, or s3_bucket must be specified."
}

variable "lambda_function_name" {
  type = string
  description = "Unique name for your Lambda Function."
}

variable "lambda_handler" {
  type = string
  description = "Function entrypoint in your code."
}

variable "source_code_hash" {
  type = string
  description = "Used to trigger updates. Must be set to a base64-encoded SHA256 hash of the package file specified with either filename or s3_key."
}

variable "lambda_runtime" {
  type = string
  default = "Identifier of the function's runtime."
}

variable "environment" {
  type = list(object({
    variables = map(string)
  }))
  description = "Configuration block."
  default = []
}

######## CloudWatch Rule #######

variable "cloudwatch_event_rule_name" {
  type = string
  description = "The name of the rule."
}

variable "cloudwatch_event_rule_description" {
  type = string
  description = "The description of the rule."
}

variable "event_pattern" {
  type = string
  description = "The event pattern described a JSON object."
}

######## DynamoDB Table #################

variable "dynamodb_table_name" {
  type = string
  description = "Unique within a region name of the table."
}

variable "dynamodb_table_hash_key" {
  type = string
  description = "Attribute to use as the hash (partition) key."
}

variable "attribute" {
  type = list(object({
    name = string
    type = string
  }))
}

variable "billing_mode" {
  type = string
  description = "Controls how you are charged for read and write throughput and how you manage capacity. The valid values are PROVISIONED and PAY_PER_REQUEST. Defaults to PROVISIONED."
  default = "PROVISIONED"
}

variable "read_capacity" {
  type = number
  description = "Number of read units for this table. If the billing_mode is PROVISIONED, this field is required."
  default = 20
}

variable "write_capacity" {
  type = number
  description = "Number of write units for this table. If the billing_mode is PROVISIONED, this field is required."
  default = 20
  
}