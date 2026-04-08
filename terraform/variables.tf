variable "vsphere_server" {
  description = "IP de ton futur vCenter"
  default     = "192.168.1.199"
}

variable "vsphere_user" {
  default = "administrator@vsphere.local"
}

variable "vsphere_password" {
  description = "Le mot de passe sera lu depuis secrets.tfvars"
  sensitive   = true
}

variable "esxi_ips" {
  type    = list(string)
  default = ["192.168.1.200", "192.168.1.201"]
}
