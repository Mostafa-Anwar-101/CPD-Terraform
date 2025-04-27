output "bastion_public_ip" {
  description = "Public IP of the bastion host"
  value       = aws_instance.bastion.public_ip
}

output "rds_endpoint" {
  description = "Endpoint of the RDS instance"
  value       = aws_db_instance.main.endpoint
}

output "elasticache_endpoint" {
  description = "Endpoint of the ElastiCache cluster"
  value       = aws_elasticache_cluster.main.cache_nodes[0].address
}

output "lambda_function_arn" {
  description = "ARN of the Lambda function"
  value       = aws_lambda_function.lab2-lambda.arn
}