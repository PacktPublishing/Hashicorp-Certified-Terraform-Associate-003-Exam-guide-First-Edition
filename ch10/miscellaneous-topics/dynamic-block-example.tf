variable "dynamodb_attributes" {

  type = list(object({
    name = string
    type = string
  }))

  default = [{
    name = "AccountName"
    type = "S"
    },
    {
      name = "AccountId"
      type = "N"
    }]

}

resource "aws_dynamodb_table" "account-table" {

  name           = "Accounttable"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "AccountId"
  range_key      = "AccountName"

  dynamic "attribute" {
    for_each = var.dynamodb_attributes
    content {
      name = attribute.value["name"]
      type = attribute.value["type"]
    }
  }

  tags = {
    Description = "Account Table"
    CreatedBy   = "dynamic {} block"
  }
} 