data "ibm_is_zones" "regional" {
  region = var.region
}

data "ibm_iam_auth_token" "token_data" {}