output "this" {
  value     = aws_kms_key.this
  sensitive = true
}

output "access_policy_arn" {
  value = one(module.access_policy[*].this.arn)
}