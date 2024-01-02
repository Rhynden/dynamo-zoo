
// Stores the paths of images stored in s3
resource "aws_dynamodb_table" "s3_imagepath_table" {
  name         = var.table_name
  billing_mode = var.table_billing_mode
  hash_key     = "animal_name"
  range_key    = "s3_object_key"
  attribute {
    name = "animal_name"
    type = "S"
  }
  attribute {
    name = "s3_object_key"
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
  "s3_object_key": {"S": "${aws_s3_object.dog1.id}"}
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
  "s3_object_key": {"S": "${aws_s3_object.dog2.id}"}
}
ITEM
}

resource "aws_dynamodb_table_item" "cat1" {
  table_name = aws_dynamodb_table.s3_imagepath_table.name
  hash_key   = aws_dynamodb_table.s3_imagepath_table.hash_key
  range_key  = aws_dynamodb_table.s3_imagepath_table.range_key

  item = <<ITEM
{
  "animal_name": {"S": "cat"},
  "s3_object_key": {"S": "${aws_s3_object.cat1.id}"}
}
ITEM
}

resource "aws_dynamodb_table_item" "cat2" {
  table_name = aws_dynamodb_table.s3_imagepath_table.name
  hash_key   = aws_dynamodb_table.s3_imagepath_table.hash_key
  range_key  = aws_dynamodb_table.s3_imagepath_table.range_key

  item = <<ITEM
{
  "animal_name": {"S": "cat"},
  "s3_object_key": {"S": "${aws_s3_object.cat2.id}"}
}
ITEM
}

resource "aws_dynamodb_table_item" "bird1" {
  table_name = aws_dynamodb_table.s3_imagepath_table.name
  hash_key   = aws_dynamodb_table.s3_imagepath_table.hash_key
  range_key  = aws_dynamodb_table.s3_imagepath_table.range_key

  item = <<ITEM
{
  "animal_name": {"S": "bird"},
  "s3_object_key": {"S": "${aws_s3_object.bird1.id}"}
}
ITEM
}

resource "aws_dynamodb_table_item" "birds2" {
  table_name = aws_dynamodb_table.s3_imagepath_table.name
  hash_key   = aws_dynamodb_table.s3_imagepath_table.hash_key
  range_key  = aws_dynamodb_table.s3_imagepath_table.range_key

  item = <<ITEM
{
  "animal_name": {"S": "bird"},
  "s3_object_key": {"S": "${aws_s3_object.bird2.id}"}
}
ITEM
}