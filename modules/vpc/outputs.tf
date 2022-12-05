output "vpc_id" {
  value = ibm_is_vpc.vpc.id
}

output "subnet_ids" {
  value = ibm_is_subnet.frontend.*.id
}

output "public_gateway_ids" {
  value = ibm_is_public_gateway.gateways.*.id
}