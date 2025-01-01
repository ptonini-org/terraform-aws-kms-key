variable "name" {}

variable "description" {
  default = null
}

variable "key_usage" {
  default = "ENCRYPT_DECRYPT"
}

variable "customer_master_key_spec" {
  default = "SYMMETRIC_DEFAULT"
}

variable "policy_statement" {
  default = null
}

variable "policy_api_version" {
  default = "2012-10-17"
}

variable "enable_key_rotation" {
  default = true
}

variable "deletion_window_in_days" {
  default = 10
}

variable "access_policy" {
  default = false
}

variable "tags" {
  type    = map(string)
  default = {}
}