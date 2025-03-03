# Module hello_world - Outputs

output "bucket_name" {
  description = "Nom du bucket S3 créé"
  value       = aws_s3_bucket.hello_world.bucket
}

output "bucket_region" {
  description = "Région AWS où le bucket S3 est créé"
  value       = aws_s3_bucket.hello_world.region
}

output "bucket_arn" {
  description = "ARN du bucket S3 créé"
  value       = aws_s3_bucket.hello_world.arn
}

output "bucket_policy" {
  description = "Policy du bucket S3"
  value       = aws_s3_bucket_policy.hello_world.policy
}
