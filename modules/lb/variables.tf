variable "vpc_id" {
  type        = string
  description = "VPC onde o ALB será criado"
}

variable "public_subnets" {
  type        = list(string)
  description = "Subnets públicas para colocar o ALB"
}

variable "target_instances" {
  type        = list(string)
  description = "IDs das instâncias EC2 privadas"
}

variable "tags" {
  type        = map(string)
  default     = {}
}
