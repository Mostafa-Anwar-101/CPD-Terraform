variable "environment" {
  description = "The deployment environment (dev or prod)"
  type        = string
}

variable "region" {
  description = "The AWS region"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnets" {
  description = "Map of public subnets with their CIDR blocks"
  type        = map(string)
}

variable "private_subnets" {
  description = "Map of private subnets with their CIDR blocks"
  type        = map(string)
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "db_instance_class" {
  description = "RDS instance class"
  type        = string
}

variable "db_name" {
  description = "Database name"
  type        = string
}

variable "db_username" {
  description = "Database username"
  type        = string
}

variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}