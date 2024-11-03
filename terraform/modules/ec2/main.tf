resource "aws_instance" "dev_instance" {
  ami           = var.machine_type == "x86_64" ? "ami-047126e50991d067b" : "ami-0d970c99a71e9769a"
  instance_type = var.instance_type

  vpc_security_group_ids      = data.aws_security_groups.security_groups.ids
  associate_public_ip_address = true

  user_data = base64encode(file("${path.module}/conf/user-data"))

  subnet_id = data.aws_subnets.subnets.ids[0]
  tags = {
    Name = var.instance_name
  }
  iam_instance_profile = var.iam_instance_profile
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = data.aws_vpc.vpc.id

  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}

output "instance_ip" {
  value = aws_instance.dev_instance.public_ip
}
