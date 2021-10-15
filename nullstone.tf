terraform {
  required_providers {
    ns = {
      source = "nullstone-io/ns"
    }
  }
}

variable "app_metadata" {
  description = <<EOF
App Metadata is injected from the app on-the-fly.
This contains information about resources created in the app module that are needed by the capability.
EOF

  type    = map(string)
  default = {}
}

data "ns_workspace" "this" {}

data "ns_connection" "efs" {
  name = "efs"
  type = "efs/aws"
}

locals {
  fs_id                = data.ns_connection.efs.outputs.efs_id
  fs_security_group_id = data.ns_connection.efs.outputs.security_group_id
}
