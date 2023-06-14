variable "cidr" {
  description = "required for subnet defination for CIDR logical partition"
  type        = list(any)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}


variable "az" {
  description = "required for subnet defination for multi AZ"
  type        = list(any)
  default     = ["ap-south-1a", "ap-south-1b"]
}
