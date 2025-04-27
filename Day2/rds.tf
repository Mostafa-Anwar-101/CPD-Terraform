resource "aws_db_subnet_group" "main" {
  name       = "${var.environment}-db-subnet-group"
  subnet_ids = [for subnet in aws_subnet.private : subnet.id]

  tags = {
    Name        = "${var.environment}-db-subnet-group"
    Environment = var.environment
  }
}

resource "aws_db_instance" "main" {
  identifier           = "${var.environment}-mysql"
  engine               = "mysql"
  engine_version       = "8.0.35"  
  instance_class       = "db.t3.micro"  
  allocated_storage    = 20  
  max_allocated_storage = 20 
  storage_type         = "gp2"
  
  
  license_model        = "general-public-license"
  publicly_accessible  = false
  multi_az             = false
  storage_encrypted    = false 
  
  
  username            = var.db_username
  password            = var.db_password
  db_name             = var.db_name
  

  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [aws_security_group.rds.id]
  skip_final_snapshot    = true 
  

  backup_retention_period = 1 
  backup_window          = "03:00-04:00" 
  maintenance_window     = "sun:04:00-sun:05:00"
 
  parameter_group_name = "default.mysql8.0"
  deletion_protection  = false  
  
  tags = {
    Name        = "${var.environment}-mysql"
    Environment = var.environment
  }
}