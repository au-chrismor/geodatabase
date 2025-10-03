resource aws_security_group "vpc_access_sg" {
  description = "Access within VPC Subnets"
  name = "${var.project}-${var.environment}-vpc-sec"
  vpc_id = var.vpc_id
  ingress {
    cidr_blocks = [ var.vpc_cidr ]
    from_port = 0
    protocol = "ALL"
    to_port = 0
  }
  egress {
    cidr_blocks = [ "0.0.0.0/0" ]
    from_port = 0
    protocol = "ALL"
    to_port = 0
  }
}
resource aws_security_group "vpc_https_sg" {
  description = "Access within VPC Subnets"
  name = "${var.project}-${var.environment}-vpc-https"
  vpc_id = var.vpc_id
  ingress {
    cidr_blocks = [ var.vpc_cidr ]
    from_port = 443
    protocol = "TCP"
    to_port = 443
  }
  egress {
    cidr_blocks = [ "0.0.0.0/0" ]
    from_port = 0
    protocol = "ALL"
    to_port = 0
  }
}

resource aws_security_group "db_sg" {
  description = "VPC Access to Database"
  name = "${var.project}-${var.environment}-db-sec"
  vpc_id = var.vpc_id
  ingress {
    cidr_blocks = [ var.vpc_cidr ]
    from_port = var.db_port
    protocol = "tcp"
    to_port = var.db_port
  }
  egress {
    cidr_blocks = [ "0.0.0.0/0" ]
    from_port = 0
    protocol = "ALL"
    to_port = 0
  }
}
