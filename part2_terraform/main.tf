module "s3" {
  source = "./modules/s3"

  name   = var.s3_name
  region = var.aws_region
}

module "vpc" {
  source = "./modules/vpc"

  for_each = {for v in var.vpc_config: v["name"] => v}

  availability_zones = var.availability_zones
  cidr               = each.value["cidr"]
  name               = each.value["name"]
  private_subnet_tpl = each.value["private_subnet_tpl"]
  public_subnet_tpl  = each.value["public_subnet_tpl"]
}

module "human_user" {
  source = "./modules/iam-user"

  for_each = toset(var.human_users)

  name     = each.value
  system   = false
}

module "system_user" {
  source = "./modules/iam-user"

  for_each = toset(var.system_users)

  name     = each.value
  system   = true
}

# grant user access to the bucket
resource "aws_s3_bucket_policy" "bucket_policy" {

  bucket = module.s3.id
  policy = data.aws_iam_policy_document.s3_policy.json
}

resource "aws_iam_user_policy_attachment" "attach_policy_to_human_users" {

  for_each = toset(var.human_users)

  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  user       = each.value

  depends_on = [module.human_user]
}
