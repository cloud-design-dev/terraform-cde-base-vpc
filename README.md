# terraform-cde-base-vpc
Base VPC as a Terraform module. 

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_ibm"></a> [ibm](#requirement\_ibm) | 1.48.0-beta0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_ibm"></a> [ibm](#provider\_ibm) | 1.48.0-beta0 |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cos"></a> [cos](#module\_cos) | ./modules/cos | n/a |
| <a name="module_resource_group"></a> [resource\_group](#module\_resource\_group) | git::https://github.com/terraform-ibm-modules/terraform-ibm-resource-group.git | v1.0.3 |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ./modules/vpc | n/a |

## Resources

| Name | Type |
|------|------|
| [random_string.prefix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [ibm_iam_auth_token.token_data](https://registry.terraform.io/providers/IBM-Cloud/ibm/1.48.0-beta0/docs/data-sources/iam_auth_token) | data source |
| [ibm_is_zones.regional](https://registry.terraform.io/providers/IBM-Cloud/ibm/1.48.0-beta0/docs/data-sources/is_zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_existing_resource_group"></a> [existing\_resource\_group](#input\_existing\_resource\_group) | The name of an existing resource group to use. If not specified, a new resource group will be created. | `string` | `null` | no |
| <a name="input_owner"></a> [owner](#input\_owner) | n/a | `any` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The IBM Cloud region where VPC and related resources will be deployed. Use the command `ibmcloud is regions` to list available regions. | `string` | `"us-south"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->