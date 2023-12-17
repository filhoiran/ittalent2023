resource "aws_instance" "ec2-irede" {
  count         = 2
  ami           = "ami-0fc5d935ebf8bc3bc"
  instance_type = "t2.micro"
  key_name      = "terraform-ittalent"

  vpc_security_group_ids = ["sg-0774c692096dca148"]

#  tags = {
#    Name = "web-terraform-instance-${count.index + 1}"
#  }

provisioner "file" {
    source = "script.sh"
    destination = "/tmp/script.sh"
  }

provisioner "remote-exec" {
    inline = [
        "sudo chmod +x /tmp/script.sh",
        "sudo bash /tmp/script.sh",
        "sudo systemctl restart nginx",
    ]
  }

connection {
    type = "ssh"
    user = "ubuntu"
    private_key = file("./terraform-ittalent.pem")
    host = self.public_ip
  }

}