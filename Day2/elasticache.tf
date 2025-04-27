resource "aws_elasticache_subnet_group" "main" {
  name       = "${var.environment}-redis-subnet-group"
  subnet_ids = [for subnet in aws_subnet.private : subnet.id]
}

resource "aws_elasticache_cluster" "main" {
  cluster_id           = "${var.environment}-redis"
  engine              = "redis"
  node_type           = "cache.t2.micro"
  num_cache_nodes     = 1
  parameter_group_name = "default.redis5.0"
  engine_version      = "5.0.6"
  port               = 6379
  security_group_ids = [aws_security_group.elasticache.id]
  subnet_group_name  = aws_elasticache_subnet_group.main.name

  tags = {
    Name        = "${var.environment}-redis"
    Environment = var.environment
  }
}