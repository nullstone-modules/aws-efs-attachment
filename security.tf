locals {
  fs_port = 2049
}

resource "aws_security_group_rule" "app-to-datastore" {
  security_group_id        = var.app_metadata["security_group_id"]
  type                     = "egress"
  from_port                = local.fs_port
  to_port                  = local.fs_port
  protocol                 = "tcp"
  source_security_group_id = local.fs_security_group_id
}

resource "aws_security_group_rule" "datastore-from-app" {
  security_group_id        = local.fs_security_group_id
  type                     = "ingress"
  from_port                = local.fs_port
  to_port                  = local.fs_port
  protocol                 = "tcp"
  source_security_group_id = var.app_metadata["security_group_id"]
}
