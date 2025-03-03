# Module hello_world - Fichier principal

# Création d'une chaîne aléatoire pour rendre le nom du bucket unique
resource "random_string" "suffix" {
  length  = 8
  special = false
  upper   = false
}

# Création d'un bucket S3 "Hello World"
resource "aws_s3_bucket" "hello_world" {
  bucket = "${var.bucket_name_prefix}-${var.environment}-${random_string.suffix.result}"
  
  tags = merge(
    var.tags,
    {
      Name        = "Hello World Bucket"
      Environment = var.environment
    }
  )
}

# Resource simple pour démontrer le concept Hello World
resource "aws_s3_bucket_policy" "hello_world" {
  bucket = aws_s3_bucket.hello_world.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "HelloWorldDemoPolicy"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.hello_world.arn}/*"
        Condition = {
          StringEquals = {
            "aws:SourceVpc" = "vpc-example"  # Ceci est fictif pour la démo
          }
        }
      }
    ]
  })
}
