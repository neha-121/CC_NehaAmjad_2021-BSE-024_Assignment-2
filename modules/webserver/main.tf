# Create unique key pair per instance
resource "aws_key_pair" "this" {
  key_name   = "${var.env_prefix}-${var.instance_suffix}-key"
  public_key = file(var.public_key)
}

# EC2 Instance
resource "aws_instance" "web" {
  ami                    = "ami-000219fdca6381300"  # Amazon Linux 2023
  instance_type           = var.instance_type
  availability_zone       = var.availability_zone
  subnet_id               = var.subnet_id
  vpc_security_group_ids  = [var.security_group_id]
  key_name                = aws_key_pair.this.key_name
  associate_public_ip_address = true
  user_data               = file(var.script_path)
  tags = merge(
    var.common_tags,
    {
      Name = "${var.instance_name}-${var.instance_suffix}"
    }
  )
}
