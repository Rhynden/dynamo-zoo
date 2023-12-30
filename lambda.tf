resource "aws_lambda_permission" "lambda_permission" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.get_image_function.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.rest_api.execution_arn}/*"
}

data "archive_file" "lambda" {
  type        = "zip"
  source_file = "index.mjs"
  output_path = "lambda_function_handler.zip"
}

// Retrieves the image path from the dynamodb table to then fetch the data from the specified bucket
resource "aws_lambda_function" "get_image_function" {
  function_name    = "get_image_function"
  role             = aws_iam_role.lambda_execution_role.arn
  filename         = "lambda_function_handler.zip"
  handler          = "index.handler"
  runtime          = "nodejs18.x"
  source_code_hash = data.archive_file.lambda.output_base64sha256
}
