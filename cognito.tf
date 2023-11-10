resource "aws_cognito_user_pool" "pool" {
  name = var.pool_name
  count = var.enable_cognito_user_pool ? 1: 0
  alias_attributes = ["email", "preferred_username"]
  auto_verified_attributes = ["email"]
  email_verification_subject = var.email_verification_subject
  email_verification_message = var.email_verification_message
  password_policy {
    minimum_length = 3
    require_lowercase = true
    require_numbers = true
    require_symbols = true
    require_uppercase = true
  }
    schema {
        name                     = var.pool_name
        attribute_data_type      = "string"
        developer_only_attribute = false
        mutable                  = true  # false for "sub"
        required                 = false # true for "sub"
        string_attribute_constraints {   # if it is a string
        min_length = 0                 # 10 for "birthdate"
        max_length = 2048              # 10 for "birthdate"
        }
    }
    tags =local.common_tags
}


resource "aws_cognito_user_pool_client" "client_pool" {
    name  ="${var.pool_name}-client"
    count = "${var.enable_cognito_user_pool ? 1 : 0}"
    explicit_auth_flows = ["ADMIN_NO_SRP_AUTH"]
    user_pool_id = "${join("",aws_cognito_user_pool.pool.*.id)}"
    allowed_oauth_flows_user_pool_client = true
    allowed_oauth_flows = ["code","implicit"]
    allowed_oauth_scopes = ["email", "openid"]
    supported_identity_providers = ["COGNITO"]
    generate_secret = var.generate_secret
    callback_urls = ["https://example.com/login/callback"]
}

