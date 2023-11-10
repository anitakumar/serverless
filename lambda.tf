# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission

resource "aws_lambda_function" "test_lambda" {
  filename      = "lambdatest.zip"
  function_name = var.project
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "exports.handler"
  runtime       = "nodejs16.x"
}

resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })
}


resource "aws_lambda_permission" "allow_cloudwatch" {
  statement_id  = "AllowAPIGatewayToInvokeLambda"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.test_lambda.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "arn:aws:events:eu-west-1:111122223333:rule/RunDaily"
  qualifier     = aws_lambda_alias.test_alias.name
}

{
  "StatementId": "41f55075-5912-569a-bae5-f9531d4fa8c1",
  "Action": "lambda:InvokeFunction",
  "FunctionName": "arn:aws:lambda:us-east-1:407018653854:function:hellomy",
  "Principal": "apigateway.amazonaws.com",
  "SourceArn": "arn:aws:execute-api:us-east-1:407018653854:49osjgzlol/*/*/hellomy"
}
