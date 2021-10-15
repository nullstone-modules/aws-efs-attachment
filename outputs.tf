locals {
  env = length(var.mount_path_env_var) > 0 ? [{ name = var.mount_path_env_var, value = var.mount_path }] : []
}

output "env" {
  value = local.env
}

output "mount_points" {
  value = [
    {
      name = local.resource_name
      path = var.mount_path
      efs_volume = jsonencode({
        file_system_id = local.fs_id
        root_directory = var.source_path
      })
    }
  ]
}
