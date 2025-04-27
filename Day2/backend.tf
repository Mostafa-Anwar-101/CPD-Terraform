terraform {
  backend "s3" {
    bucket = "terraform-state-bucket-mostafa"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
