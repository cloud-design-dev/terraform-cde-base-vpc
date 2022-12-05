locals {
  zones = length(data.ibm_is_zones.regional.zones)
  vpc_zones = {
    for zone in range(local.zones) : zone => {
      zone = "${var.region}-${zone + 1}"
    }
  }
}

resource "ibm_is_vpc" "vpc" {
  name                        = "${var.prefix}-vpc"
  resource_group              = var.resource_group_id
  classic_access              = var.classic_access
  default_network_acl_name    = "${var.prefix}-default-network-acl"
  default_security_group_name = "${var.prefix}-default-security-group"
  default_routing_table_name  = "${var.prefix}-defalt-routing-table"
  address_prefix_management   = var.address_prefix_management
  tags                        = var.tags
}

resource "ibm_is_public_gateway" "gateways" {
  count          = length(data.ibm_is_zones.regional.zones)
  name           = "${var.prefix}-${count.index}-public-gateway"
  vpc            = ibm_is_vpc.vpc.id
  zone           = local.vpc_zones[count.index].zone
  resource_group = var.resource_group_id
  tags           = var.tags
}

resource "ibm_is_subnet" "frontend" {
  count                    = length(data.ibm_is_zones.regional.zones)
  name                     = "${var.prefix}-${count.index}-subnet"
  vpc                      = ibm_is_vpc.vpc.id
  zone                     = local.vpc_zones[count.index].zone
  total_ipv4_address_count = var.address_count
  public_gateway           = ibm_is_public_gateway.gateways[count.index].id
  resource_group           = var.resource_group_id
  tags                     = var.tags
}
