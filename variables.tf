variable "location" {
  description = "Azure region"
  type        = string
  default     = "East US"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "devops-lab-rg"
}

variable "virtual_network_name" {
  description = "Name of the virtual network"
  type        = string
  default     = "devops-vnet"
}

variable "vnet_address_space" {
  description = "Address space for the VNet"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
  default     = "default"
}

variable "subnet_prefixes" {
  description = "Address prefix for the subnet"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "vm_name" {
  description = "Name of the virtual machine"
  type        = string
  default     = "devops-vm"
}

variable "vm_size" {
  description = "Size of the virtual machine"
  type        = string
  default     = "Standard_B1s"
}

variable "admin_username" {
  description = "Admin username"
  type        = string
  default     = "azureuser"
  validation {
    condition     = length(var.admin_username) >= 3
    error_message = "Admin username must be at least 3 characters."
  }
}

variable "admin_password" {
  description = "Admin password"
  type        = string
  sensitive   = true
}

variable "vm_image" {
  description = "VM image definition"
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
  default = {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
}
    