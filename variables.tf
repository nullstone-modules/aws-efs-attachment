variable "mount_path" {
  type        = string
  description = <<EOF
Mount path identifies the location in the application to mount the filesystem.
EOF
}

variable "mount_path_env_var" {
  type        = string
  description = <<EOF
Mount path env name defines the name of the environment variable to inject the mount path directory to the application.
If left blank, this will not inject any environment variables.
EOF
  default     = ""
}

variable "source_path" {
  type        = string
  default     = "/"
  description = <<EOF
Source path identifies the location inside the EFS to mount.
By default, this is the "/" (root directory).
EOF
}
