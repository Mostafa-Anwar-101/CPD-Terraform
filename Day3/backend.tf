terraform {
  backend "s3" {
    bucket = "terraform-state-bucket-mostafa"
    key    = "lab-3-terraform.tfstate"
    region = "us-east-1"
    use_lockfile = true
  }
}
