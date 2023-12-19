resource "aws_vpc" "main" {
  cidr_block = var.cidr
}

module "subnets" {
  source = "./subnets"
  for_each = each.value["subnets"]
  subnets  = each.value
  vpc_id   = aws_vpc.main.id
}