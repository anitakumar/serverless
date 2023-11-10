resource "aws_dynamodb_table" "ics-account-cleanup-dynamodb-table" {
  name           = "${var.project}"
  billing_mode   = "PAY_PER_REQUEST"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "id"
  range_key      = "creation_ts"

  attribute {
    name = "candidateId"
    type = "S"
  }

   attribute {
    name = "candidateFirstName"
    type = "S"
  }

  attribute {
    name = "candidateLastName"
    type = "S"
  }

  attribute {
    name = "candidateBirthDate"
    type = "S"
  }
  attribute {
    name = "cvS3Key"
    type = "S"
  }

  
  attribute {
    name = "speciality"
    type = "S"
  }



  ttl {
    attribute_name = "ttl"
    enabled        = true
  }
  global_secondary_index {
    name               = "${var.project}-index"
    hash_key           = "candidateId"
    projection_type    = "KEYS_ONLY"
  }
  

  tags = local.common_tags
}

