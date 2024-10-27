# Create a new Security in a VPC
resource "alicloud_security_group" "bastion" {
  name        = "http_bastion"
  description = "http_bastion"
  vpc_id      = alicloud_vpc.capstone-vpc.id
}

resource "alicloud_security_group_rule" "allow_bastin_ssh" {
  type              = "ingress"
  ip_protocol       = "tcp"
  policy            = "accept"
  port_range        = "22/22"
  priority          = 1
  security_group_id = alicloud_security_group.bastion.id
  cidr_ip           = "0.0.0.0/0"
}
