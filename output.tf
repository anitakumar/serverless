# Cognito output
output "aws_cognito_pool_id" {
    value = "${element(concat(aws_cognito_user_pool.pool.*.id,list("")),0)}"
}
output "cognito_pool_arn" {
    value =  "${element(concat(aws_cognito_user_pool.arn.*.id,list("")),0)}"
}

output "cognito_endpoint" {
    value =  "${element(concat(aws_cognito_user_pool.endpoint.*.id,list("")),0)}"
}