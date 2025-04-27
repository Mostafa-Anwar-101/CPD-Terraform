module "lab-3-network" {
  source = "./network"

  name_prefix = "lab-3"
  vpc_cidr    = "10.0.0.0/16"

  public_subnets = {
    "public-1" = "10.0.1.0/24",
    "public-2" = "10.0.2.0/24"
  }

  private_subnets = {
    "private-1" = "10.0.3.0/24",
    "private-2" = "10.0.4.0/24"
  }

  availability_zones = ["us-east-1a", "us-east-1b"]
}