variable "private_subnets" {
  description = "Lista de subnets privadas para criar instâncias"
  type        = list(string)
}

variable "instance_type" {
  description = "Tipo da instância EC2"
  type        = string
}

variable "ami" {
  description = "AMI para as instâncias"
  type        = string
}

variable "environment" {
  description = "Ambiente (dev, staging, prod)"
  type        = string
}

variable "tags" {
  description = "Tags para associar aos recursos"
  type        = map(string)
}
