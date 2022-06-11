data "ns_connection" "efs" {
  name     = "efs"
  type     = "efs/aws"
  contract = "datastore/aws/efs"
}

locals {
  fs_id                = data.ns_connection.efs.outputs.efs_id
  fs_security_group_id = data.ns_connection.efs.outputs.security_group_id
}
