
// Stores the paths of images stored in s3
resource "aws_dynamodb_table" "s3_imagepath_table" {
  name         = var.table_name
  billing_mode = var.table_billing_mode
  hash_key     = "animal_name"
  range_key    = "image_uri"
  attribute {
    name = "animal_name"
    type = "S"
  }
  attribute {
    name = "image_uri"
    type = "S"
  }
  tags = {
    environment = "${var.environment}"
  }
}

// DynamoDB items
resource "aws_dynamodb_table_item" "dog1" {
  table_name = aws_dynamodb_table.s3_imagepath_table.name
  hash_key   = aws_dynamodb_table.s3_imagepath_table.hash_key
  range_key  = aws_dynamodb_table.s3_imagepath_table.range_key

  item = <<ITEM
{
  "animal_name": {"S": "dog"},
  "image_uri": {"S": "www.s3.de/dog1"}
}
ITEM
}

resource "aws_dynamodb_table_item" "dog2" {
  table_name = aws_dynamodb_table.s3_imagepath_table.name
  hash_key   = aws_dynamodb_table.s3_imagepath_table.hash_key
  range_key  = aws_dynamodb_table.s3_imagepath_table.range_key

  item = <<ITEM
{
  "animal_name": {"S": "dog"},
  "image_uri": {"S": "www.s3.de/dog2"}
}
ITEM
}