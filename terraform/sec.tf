
resource "aws_security_group" "frontend_server" {
  name = "frontend_sg"

  tags = {
    Name = "Frontend Server SG"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_frontend" {
  security_group_id = aws_security_group.frontend_server.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
  tags = {
    Name = "Allow SSH in"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_frontend" {
  security_group_id = aws_security_group.frontend_server.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 3000
  to_port           = 3000
  ip_protocol       = "tcp"
  description       = "Allow Frontend access"
  tags = {
    Name = "Allow Frontend access"
  }
}

resource "aws_vpc_security_group_egress_rule" "allow_all_frontend" {
  security_group_id = aws_security_group.frontend_server.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
  tags = {
    Name = "Allow all trafic out"
  }
}
resource "aws_security_group" "backend_server" {
  name = "backend_sg"

  tags = {
    Name = "Backend Server SG"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_mysql_backend" {
  security_group_id = aws_security_group.backend_server.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 3306
  to_port           = 3306
  ip_protocol       = "tcp"
  description       = "Allow MySQL access"
  tags = {
    Name = "Allow MySQL access"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_backend" {
  security_group_id = aws_security_group.backend_server.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
  tags = {
    Name = "Allow SSH in"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_backend" {
  security_group_id = aws_security_group.backend_server.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 8080
  ip_protocol       = "tcp"
  to_port           = 8080
  tags = {
    Name = "Allow Backend in"
  }
}

resource "aws_vpc_security_group_egress_rule" "allow_all_backend" {
  security_group_id = aws_security_group.backend_server.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
  tags = {
    Name = "Allow all trafic out"
  }
}