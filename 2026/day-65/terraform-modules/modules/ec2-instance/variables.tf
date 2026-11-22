variable "ami_id" {
  type        = string
}

variable "instance_type" {
  type        = string
  default     = "t3.micro"
}

variable "subnet_id" {
  type        = string
}

variable "security_group_ids" {
  type        = list(string)
  default     = ["sg-0a0d29c014bed12ac"]
}

variable "instance_name" {
  type        = string
}

variable "tags" {
  type        = map(string)
  default     = {}
}