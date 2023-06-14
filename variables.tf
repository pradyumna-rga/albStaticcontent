variable "aws_access_key" {
  type = string
}

variable "aws_secret_access_key" {
  type = string
}

variable "S3_REGION" {
  description = "S3 bucket Region"
  type        = string
  default     = "ap-south-1"
}
variable "DYN_DB_TABLE_NAME" {
  description = "DynamoDB for maintaining LockID"
  type        = string
}

variable "AWS_REGION" {
  description = "AWS Region"
  type        = string
  default     = "ap-south-1"
}

variable "cidr" {
  type    = list(any)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "ec2_count_main" {
  type    = number
  default = 2
}

variable "az" {
  description = "holds list of mumbai region AZ"
  type        = list(any)
  default     = ["ap-south-1a", "ap-south-1b"]
}
