resource "aws_kms_key" "this" {
  description              = coalesce(var.description, var.name)
  key_usage                = var.key_usage
  customer_master_key_spec = var.customer_master_key_spec
  deletion_window_in_days  = var.deletion_window_in_days
  enable_key_rotation      = var.enable_key_rotation
  policy = var.policy_statement == null ? null : jsonencode({
    Version   = var.policy_api_version
    Statement = var.policy_statement
  })
  tags = var.tags
}


module "access_policy" {
  #checkov:skip=CKV_TF_1: Private module
  source  = "app.terraform.io/ptonini-org/iam-policy/aws"
  version = "~> 1.0.0"
  count   = var.access_policy ? 1 : 0
  name    = "${var.name}-kms-key"
  statement = [{
    effect = "Allow"
    actions = [
      "kms:Encrypt",
      "kms:Decrypt",
      "kms:DescribeKey"
    ],
    resources = [aws_kms_key.this.arn]
  }]
}