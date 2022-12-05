resource "ibm_resource_instance" "cos" {
  name              = "${var.prefix}-cos-instance"
  service           = "cloud-object-storage"
  plan              = "standard"
  location          = "global"
  resource_group_id = var.resource_group_id
  tags              = var.tags
  timeouts {
    create = "15m"
    update = "15m"
    delete = "15m"
  }
}

resource "ibm_cos_bucket" "flowlogs" {
  count                = length(var.frontend_buckets)
  depends_on           = [ibm_resource_instance.cos]
  bucket_name          = "${var.prefix}-${var.frontend_buckets[count.index]}-bucket"
  resource_instance_id = ibm_resource_instance.cos.id
  region_location      = var.region
  storage_class        = "smart"
}

resource "ibm_cos_bucket" "pag" {
  depends_on           = [ibm_resource_instance.cos]
  bucket_name          = "${var.prefix}-pag-bucket"
  resource_instance_id = ibm_resource_instance.cos.id
  region_location      = var.region
  storage_class        = "smart"
}