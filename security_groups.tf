resource "aws_security_group" "allow_connections_hacking_lab" {
  name        = "allow_connections_hacking_lab"
  description = "Allow TLS inbound traffic for ssh but only for host PCs external IP. Created with terraform for the hacking lab"


  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = formatlist("%s/32", list(chomp(data.http.external_ip.body)))
  }
  ingress {
    from_port   = 81
    to_port     = 81
    protocol    = "tcp"
    cidr_blocks = formatlist("%s/32", list(chomp(data.http.external_ip.body)))
  }

  tags = {
    Name = "allow_connections_hacking_lab"
  }
  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "6"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "6"
    cidr_blocks = ["0.0.0.0/0"]
  }
}