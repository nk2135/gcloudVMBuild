variable "instance_name" {
  description = "Name of the VM instance"
  type        = string
  default     = "default-instance-name" // Default value, can be overridden
}

variable "machine_type" {
  description = "Type of the VM instance"
  type        = string
  default     = "f1-micro"
}

variable "zone" {
  description = "The zone where the VM will be created"
  type        = string
  default     = "us-central1-a"
}

variable "boot_disk"{
description = "Boot disk for VM"
type        = number
default     = 60
}

