resource "aws_dynamodb_table" "this" {
  name           = var.dynamodb_table_name
  hash_key       = var.dynamodb_table_hash_key
  billing_mode   = var.billing_mode
  read_capacity  = var.read_capacity
  write_capacity = var.write_capacity
  dynamic "attribute" {
    for_each = var.attribute
    content {
      name = lookup(attribute.value,"name")
      type = lookup(attribute.value,"type")
    }
  }
}