locals {
  deploy_date = formatdate("YYYY-MM-DD", timestamp())
  tags = [
    "vpc:${var.prefix}-vpc",
    "region:${var.region}",
    "owner:${var.owner}",
    "workspace:${terraform.workspace}",
    "provider:ibmcloud"
  ]

  zones = length(data.ibm_is_zones.regional.zones)
  vpc_zones = {
    for zone in range(local.zones) : zone => {
      zone = "${var.region}-${zone + 1}"
    }
  }
}
