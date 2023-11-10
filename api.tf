# api gateway
resource "aws_apigatewayv2_api" "this" {
  name          = var.project
  protocol_type = "HTTP"
}



resource "aws_apigatewayv2_integration" "this" {
  api_id           = aws_apigatewayv2_api.this.id
  integration_type = "AWS_PROXY"

  connection_type           = "INTERNET"
  content_handling_strategy = "CONVERT_TO_TEXT"
  description               = "Lambda example"
  integration_method        = "POST"
  integration_uri           = aws_lambda_function.this.invoke_arn
  passthrough_behavior      = "WHEN_NO_MATCH"
}
# permision on lambda to let api gateway invoke lambda function
# https://docs.aws.amazon.com/lambda/latest/dg/services-apigateway.html#apigateway-permissions



# https://stackoverflow.com/questions/57288992/terraform-how-to-create-iam-role-for-aws-lambda-and-deploy-both