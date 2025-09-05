variable "cidr_map" {
  type = map(string)
  default = {
    dev     = "10.0.0.0/16"
    staging = "10.1.0.0/16"
    prod    = "10.2.0.0/16"
  }
}

variable "public_subnets_map" {
  type = map(list(string))
  default = {
    dev     = ["10.0.1.0/24", "10.0.2.0/24"]
    staging = ["10.1.1.0/24", "10.1.2.0/24"]
    prod    = ["10.2.1.0/24", "10.2.2.0/24"]
  }
}

variable "private_subnets_map" {
  type = map(list(string))
  default = {
    dev     = ["10.0.101.0/24", "10.0.102.0/24"]
    staging = ["10.1.101.0/24", "10.1.102.0/24"]
    prod    = ["10.2.101.0/24", "10.2.102.0/24"]
  }
}

variable "azs" {
  type    = list(string)
  default = ["us-east-2a", "us-east-2b"]
}
