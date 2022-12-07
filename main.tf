module "resource_group" {
  source                       = "git::https://github.com/terraform-ibm-modules/terraform-ibm-resource-group.git?ref=v1.0.4"
  resource_group_name          = var.existing_resource_group == null ? "${var.prefix}-resource-group" : null
  existing_resource_group_name = var.existing_resource_group
}

resource "ibm_is_vpc" "vpc" {
  name                        = "${var.prefix}-vpc"
  resource_group              = module.resource_group.resource_group_id
  classic_access              = var.classic_access
  address_prefix_management   = var.default_address_prefix
  default_network_acl_name    = "${var.prefix}-default-network-acl"
  default_security_group_name = "${var.prefix}-default-security-group"
  default_routing_table_name  = "${var.prefix}-default-routing-table"
  tags                        = local.tags
}

resource "ibm_is_public_gateway" "pgw" {
  count          = length(data.ibm_is_zones.regional.zones)
  name           = "${var.prefix}-${local.vpc_zones[count.index].zone}-pubgw"
  resource_group = module.resource_group.resource_group_id
  vpc            = ibm_is_vpc.vpc.id
  zone           = local.vpc_zones[count.index].zone
  tags           = local.tags
}

resource "ibm_is_subnet" "subnet" {
  count                    = length(data.ibm_is_zones.regional.zones)
  name                     = "${var.prefix}-${local.vpc_zones[count.index].zone}-pubgw"
  resource_group           = module.resource_group.resource_group_id
  vpc                      = ibm_is_vpc.vpc.id
  zone                     = local.vpc_zones[count.index].zone
  total_ipv4_address_count = var.number_of_addresses
  network_acl              = ibm_is_vpc.vpc.default_network_acl
  public_gateway           = ibm_is_public_gateway.pgw[count.index].id
  routing_table            = ibm_is_vpc.vpc.default_routing_table
}
