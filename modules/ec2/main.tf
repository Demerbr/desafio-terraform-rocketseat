resource "aws_instance" "private_ec2" {
  count         = 2
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = element(var.private_subnets, count.index)

  # Usa o security group padrão da subnet
  vpc_security_group_ids = []

  tags = merge(var.tags, {
    Name = "ec2-private-${var.environment}-${count.index + 1}"
  })
}
