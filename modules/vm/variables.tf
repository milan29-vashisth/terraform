variable "environment" {}
variable "location" {}
variable "resource_group_name" {}
variable "subnet_id" {}

variable "vm_size" {}
variable "admin_username" {}

variable "vm_password" {
  sensitive = true
}