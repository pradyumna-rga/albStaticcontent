resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.cidr[count.index]
  availability_zone = var.az[count.index]
  count             = 2

  tags = {
    Name = "public-sub"
  }
}

data "aws_subnets" "subnet_id" {
  filter {
    name   = "vpc-id"
    values = [aws_vpc.my_vpc.id]
  }

  tags = {
    Tier = "Public"
  }
}
