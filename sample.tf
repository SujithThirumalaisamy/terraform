terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}
provider "aws" {
  region = "ap-south-1"
}
resource "aws_s3_bucket" "lab-etl-s3" {
  bucket = "lab-etl-s3"

  tags = {
    Name        = "Student Bucket"
    Environment = "Learning"
  }
}
resource "aws_s3_object" "lab-etl-s3-p1" {
  depends_on = [aws_s3_bucket.lab-etl-s3]
  bucket     = aws_s3_bucket.lab-etl-s3.id
  key        = "product-0.json"
  source     = "./data/product-0.json"
  etag       = filemd5("./data/product-0.json")
}
resource "aws_s3_object" "lab-etl-s3-p2" {
  depends_on = [aws_s3_bucket.lab-etl-s3]
  bucket     = aws_s3_bucket.lab-etl-s3.id
  key        = "product-1.json"
  source     = "./data/product-1.json"
  etag       = filemd5("./data/product-1.json")
}
resource "aws_s3_object" "lab-etl-s3-p3" {
  depends_on = [aws_s3_bucket.lab-etl-s3]
  bucket     = aws_s3_bucket.lab-etl-s3.id
  key        = "product-2.json"
  source     = "./data/product-2.json"
  etag       = filemd5("./data/product-2.json")
}
resource "aws_s3_object" "lab-etl-s3-py" {
  depends_on = [aws_s3_bucket.lab-etl-s3]
  bucket     = aws_s3_bucket.lab-etl-s3.id
  key        = "example.py"
  source     = "./data/example.py"
  etag       = filemd5("./data/example.py")
}
resource "aws_dynamodb_table" "lab-etl-dy-table-orders" {
  name         = "orders"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "order_id"

  attribute {
    name = "order_id"
    type = "N"
  }
}
resource "aws_dynamodb_table_item" "lab-etl-dy-table-order-1" {
  depends_on = [aws_dynamodb_table.lab-etl-dy-table-orders]
  table_name = aws_dynamodb_table.lab-etl-dy-table-orders.name
  hash_key   = aws_dynamodb_table.lab-etl-dy-table-orders.hash_key
  item       = <<ITEM
  {
    "order_id": {"N": "1001"},
    "customer_id": {"N": "201"},
    "order_date": {"N": "1682291861"},
    "price": {"N": "25.50"},
    "product_id": {"N": "41"},
    "quantity": {"N": "3"}
  }
  ITEM
}

resource "aws_dynamodb_table_item" "lab-etl-dy-table-order-2" {
  depends_on = [aws_dynamodb_table.lab-etl-dy-table-orders]
  table_name = aws_dynamodb_table.lab-etl-dy-table-orders.name
  hash_key   = aws_dynamodb_table.lab-etl-dy-table-orders.hash_key
  item       = <<ITEM
  {
    "order_id": {"N": "1002"},
    "customer_id": {"N": "202"},
    "order_date": {"N": "1682292861"},
    "price": {"N": "30.00"},
    "product_id": {"N": "42"},
    "quantity": {"N": "1"}
  }
  ITEM
}

resource "aws_dynamodb_table_item" "lab-etl-dy-table-order-3" {
  depends_on = [aws_dynamodb_table.lab-etl-dy-table-orders]
  table_name = aws_dynamodb_table.lab-etl-dy-table-orders.name
  hash_key   = aws_dynamodb_table.lab-etl-dy-table-orders.hash_key
  item       = <<ITEM
  {
    "order_id": {"N": "1003"},
    "customer_id": {"N": "203"},
    "order_date": {"N": "1682293861"},
    "price": {"N": "45.00"},
    "product_id": {"N": "43"},
    "quantity": {"N": "2"}
  }
  ITEM
}

resource "aws_dynamodb_table_item" "lab-etl-dy-table-order-4" {
  depends_on = [aws_dynamodb_table.lab-etl-dy-table-orders]
  table_name = aws_dynamodb_table.lab-etl-dy-table-orders.name
  hash_key   = aws_dynamodb_table.lab-etl-dy-table-orders.hash_key
  item       = <<ITEM
  {
    "order_id": {"N": "1004"},
    "customer_id": {"N": "204"},
    "order_date": {"N": "1682294861"},
    "price": {"N": "55.75"},
    "product_id": {"N": "44"},
    "quantity": {"N": "4"}
  }
  ITEM
}

resource "aws_dynamodb_table_item" "lab-etl-dy-table-order-5" {
  depends_on = [aws_dynamodb_table.lab-etl-dy-table-orders]
  table_name = aws_dynamodb_table.lab-etl-dy-table-orders.name
  hash_key   = aws_dynamodb_table.lab-etl-dy-table-orders.hash_key
  item       = <<ITEM
  {
    "order_id": {"N": "1005"},
    "customer_id": {"N": "205"},
    "order_date": {"N": "1682295861"},
    "price": {"N": "60.00"},
    "product_id": {"N": "45"},
    "quantity": {"N": "1"}
  }
  ITEM
}

resource "aws_dynamodb_table_item" "lab-etl-dy-table-order-6" {
  depends_on = [aws_dynamodb_table.lab-etl-dy-table-orders]
  table_name = aws_dynamodb_table.lab-etl-dy-table-orders.name
  hash_key   = aws_dynamodb_table.lab-etl-dy-table-orders.hash_key
  item       = <<ITEM
  {
    "order_id": {"N": "1006"},
    "customer_id": {"N": "206"},
    "order_date": {"N": "1682296861"},
    "price": {"N": "35.50"},
    "product_id": {"N": "46"},
    "quantity": {"N": "3"}
  }
  ITEM
}

resource "aws_dynamodb_table_item" "lab-etl-dy-table-order-7" {
  depends_on = [aws_dynamodb_table.lab-etl-dy-table-orders]
  table_name = aws_dynamodb_table.lab-etl-dy-table-orders.name
  hash_key   = aws_dynamodb_table.lab-etl-dy-table-orders.hash_key
  item       = <<ITEM
  {
    "order_id": {"N": "1007"},
    "customer_id": {"N": "207"},
    "order_date": {"N": "1682297861"},
    "price": {"N": "50.25"},
    "product_id": {"N": "47"},
    "quantity": {"N": "2"}
  }
  ITEM
}

resource "aws_dynamodb_table_item" "lab-etl-dy-table-order-8" {
  depends_on = [aws_dynamodb_table.lab-etl-dy-table-orders]
  table_name = aws_dynamodb_table.lab-etl-dy-table-orders.name
  hash_key   = aws_dynamodb_table.lab-etl-dy-table-orders.hash_key
  item       = <<ITEM
  {
    "order_id": {"N": "1008"},
    "customer_id": {"N": "208"},
    "order_date": {"N": "1682298861"},
    "price": {"N": "40.75"},
    "product_id": {"N": "48"},
    "quantity": {"N": "1"}
  }
  ITEM
}

resource "aws_dynamodb_table_item" "lab-etl-dy-table-order-9" {
  depends_on = [aws_dynamodb_table.lab-etl-dy-table-orders]
  table_name = aws_dynamodb_table.lab-etl-dy-table-orders.name
  hash_key   = aws_dynamodb_table.lab-etl-dy-table-orders.hash_key
  item       = <<ITEM
  {
    "order_id": {"N": "1009"},
    "customer_id": {"N": "209"},
    "order_date": {"N": "1682299861"},
    "price": {"N": "75.00"},
    "product_id": {"N": "49"},
    "quantity": {"N": "5"}
  }
  ITEM
}

resource "aws_dynamodb_table_item" "lab-etl-dy-table-order-10" {
  depends_on = [aws_dynamodb_table.lab-etl-dy-table-orders]
  table_name = aws_dynamodb_table.lab-etl-dy-table-orders.name
  hash_key   = aws_dynamodb_table.lab-etl-dy-table-orders.hash_key
  item       = <<ITEM
  {
    "order_id": {"N": "1010"},
    "customer_id": {"N": "210"},
    "order_date": {"N": "1682300861"},
    "price": {"N": "65.50"},
    "product_id": {"N": "50"},
    "quantity": {"N": "4"}
  }
  ITEM
}

resource "aws_iam_role" "lab-etl-role" {
  name = "lab-etl-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_policy" "lab-etl-role-policy" {
  name        = "example-policy"
  description = "Policy to allow specific actions on a specific S3 bucket"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "s3:ListBucket",
          "s3:GetBucketLocation"
        ],
        Resource = "arn:aws:s3:::your-specific-bucket-name"
      },
      {
        Effect = "Allow",
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject"
        ],
        Resource = "arn:aws:s3:::your-specific-bucket-name/*"
      },
      {
        Effect = "Deny",
        Action = [
          "s3:CreateBucket",
          "s3:DeleteBucket"
        ],
        Resource = "*"
      },
      {
        Effect   = "Deny",
        Action   = "s3:ListAllMyBuckets",
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lab-etl-role-policy-attachment" {
  role       = aws_iam_role.lab-etl-role.name
  policy_arn = aws_iam_policy.lab-etl-role-policy.arn
}


resource "aws_glue_job" "lab-etl-glue-job" {
  name     = "lab-etl-glue-job"
  role_arn = aws_iam_role.lab-etl-role.arn
  command {
    script_location = "s3://${aws_s3_bucket.lab-etl-s3.bucket}/example.py"
  }
}

resource "aws_iam_user" "lab-etl-user" {
  name = "lab-etl-user"
}

resource "random_password" "lab_user_password" {
  length           = 16
  special          = true
  override_special = "!@#$%^&*()-_=+<>?"
}

resource "aws_iam_user_login_profile" "lab-etl-user" {
  user = aws_iam_user.lab-etl-user.name
}
output "password" {
  value = aws_iam_user_login_profile.lab-etl-user.password
}
output "username" {
  value = aws_iam_user_login_profile.lab-etl-user.password
}
resource "aws_iam_access_key" "lab-etl-user" {
  user = aws_iam_user.lab-etl-user.name
}

resource "aws_iam_policy" "lab-etl-user_policy" {
  name        = "lab-user-policy"
  description = "Policy to allow access to resources created by this Terraform template"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "s3:*"
        ],
        Resource = "arn:aws:s3:::lab-etl-s3"
      },
      {
        Effect = "Allow",
        Action = [
          "s3:*"
        ],
        Resource = "arn:aws:s3:::lab-etl-s3/*"
      },
      {
        Effect = "Allow",
        Action = [
          "dynamodb:*"
        ],
        Resource = [
          "arn:aws:dynamodb:ap-south-1:lab-etl-glue-job:table/orders"
        ]
      },
      {
        Effect = "Allow",
        Action = [
          "glue:*"
        ],
        Resource = "arn:aws:glue:ap-south-1:lab-etl-glue-job:job/lab-etl-glue-job"
      },
      {
        Effect   = "Allow",
        Action   = "iam:PassRole",
        Resource = "arn:aws:iam::*:role/lab-etl-role"
      }
    ]
  })
}

resource "aws_iam_user_policy_attachment" "lab_user_policy_attachment" {
  user       = aws_iam_user.lab-etl-user.name
  policy_arn = aws_iam_policy.lab-etl-user_policy.arn
}
