output "flowlog_bucket_ids" {
  value = ibm_cos_bucket.flowlogs.*.id
}

output "pag_bucket_id" {
  value = ibm_cos_bucket.pag.id
}

output "cos_instance_id" {
  value = ibm_resource_instance.cos.id
}

