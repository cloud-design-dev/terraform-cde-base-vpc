resource "random_string" "prefix" {
  length  = 4
  special = false
  upper   = false
  numeric = false
}

locals {
  prefix      = "${random_string.prefix.result}-rt"
  deploy_date = formatdate("YYYY-MM-DD", timestamp())
  tags = [
    "vpc:${local.prefix}-vpc",
    "region:${var.region}",
    "owner:${var.owner}",
    "workspace:${terraform.workspace}",
    "provider:ibmcloud",
    "deployed:${local.deploy_date}"
  ]
}

module "resource_group" {
  source                       = "git::https://github.com/terraform-ibm-modules/terraform-ibm-resource-group.git?ref=v1.0.4"
  resource_group_name          = var.existing_resource_group == null ? "${local.prefix}-resource-group" : null
  existing_resource_group_name = var.existing_resource_group
}

module "vpc" {
  source            = "./modules/vpc"
  prefix            = local.prefix
  resource_group_id = module.resource_group.resource_group_id
  region            = var.region
  tags              = local.tags
}

module "cos" {
  source            = "./modules/cos"
  prefix            = local.prefix
  region            = var.region
  frontend_buckets  = module.vpc.subnet_ids
  resource_group_id = module.resource_group.resource_group_id
  tags              = local.tags
}



# module "flowlogs" {
#     source = "./modules/flowlogs"
# }

# module "observability" {
#     source = "./modules/observability"
# }