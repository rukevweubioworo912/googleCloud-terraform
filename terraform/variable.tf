variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP Region"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "GCP Zone"
  type        = string
  default     = "us-central1-a"
}

variable "vm_name_prefix" {
  description = "Prefix for VM names"
  type        = string
  default     = "mage-vm"
}

variable "machine_type" {
  description = "VM machine type"
  type        = string
  default     = "e2-medium"
}

variable "ssh_user" {
  description = "SSH username"
  type        = string
  default     = "ubuntu"
}


variable "ssh_public_key_path" {
  description = "SSH username"
  type        = string
  default     = "id_rsa.pub"
}