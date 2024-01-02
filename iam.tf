resource "aws_iam_role" "lambda_execution_role" {
  name                = "lambda_execution_role"
  assume_role_policy  = data.aws_iam_policy_document.lambda_assume_role_policy.json
  managed_policy_arns = [aws_iam_policy.lambda_execution_policy.arn]
}

data "aws_iam_policy_document" "lambda_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_policy" "lambda_execution_policy" {
  name = "lambda_execution_policy"

  policy = <<EOT
{
   "Version":"2012-10-17",
   "Statement":[
      {
         "Effect":"Allow",
         "Action":[
            "logs:CreateLogGroup",
            "logs:CreateLogStream",
            "logs:PutLogEvents",
            "logs:DescribeLogStreams"
         ],
         "Resource":[
            "arn:aws:logs:*:*:*"
         ]
      },
      {
         "Effect":"Allow",
         "Action":[
            "dynamodb:Query"
         ],
         "Resource":"${aws_dynamodb_table.s3_imagepath_table.arn}"
      },
      {
         "Effect":"Allow",
         "Action":[
            "s3:GetObject"
         ],
         "Resource":"${aws_s3_bucket.images_bucket.arn}/*"
      }
   ]
}
    EOT
}
