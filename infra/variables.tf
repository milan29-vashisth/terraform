variable "environment" {
type = string
}

variable "vm_password" {
  description = "VM Admin Password"
  type        = string
  sensitive   = true
}
variable "location" {
  default = "East US"
}
variable "vm_size" {}