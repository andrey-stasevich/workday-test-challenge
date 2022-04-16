aws_region = "us-east-1"

availability_zones = [
  "us-east-1a",
  "us-east-1b"
]

s3_name = "astasevich-fake-product-assets"

human_users = ["emma", "liam"]

system_users = ["fake-product"]

vpc_config = [
  {
    name = "fake-product-production"
    cidr = "10.1.0.0/16"
    private_subnet_tpl = "10.1.1%s.0/24"
    public_subnet_tpl = "10.1.2%s.0/24"
  },
  {
    name = "fake-product-staging"
    cidr = "10.2.0.0/16"
    private_subnet_tpl = "10.2.1%s.0/24"
    public_subnet_tpl = "10.2.2%s.0/24"
  }
]
