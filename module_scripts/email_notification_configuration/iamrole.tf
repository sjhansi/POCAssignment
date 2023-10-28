resource "aws_iam_role" "this" {
  name                = var.iam_role_name
  assume_role_policy  = file(var.assume_role_policy)
  managed_policy_arns = var.managed_policy_arns
  description         = var.iam_role_description
  dynamic "inline_policy" {
    for_each = var.inline_policy
    content {
      name = lookup(inline_policy.value,"name")
      policy = file(lookup(inline_policy.value,"policy"))
    }
  }
}