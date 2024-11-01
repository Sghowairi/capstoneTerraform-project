
# Create a new public instance for VPC
resource "alicloud_instance" "httpnode1" {
  # cn-beijing
  count = 2
  availability_zone = data.alicloud_zones.default.zones.0.id
  security_groups   = [alicloud_security_group.http_node1.id]

  # series III
  instance_type              = "ecs.g6.large"
  system_disk_category       = "cloud_essd"
  system_disk_name           = "shahad"
  system_disk_size           = 40
  system_disk_description    = "system_disk_description"
  image_id                   = "ubuntu_22_04_x64_20G_alibase_20240926.vhd"
  instance_name              = "httpnode1${count.index}"
  vswitch_id                 = alicloud_vswitch.privatev.id
  internet_max_bandwidth_out = 0
  internet_charge_type       = "PayByTraffic"
  instance_charge_type       = "PostPaid"
  key_name                   = alicloud_ecs_key_pair.key.key_pair_name
  user_data = base64encode(templatefile("http.tpl", {redis = alicloud_instance.redis.private_ip, db = alicloud_instance.mysql.private_ip}))
}

output "httpnode1_ip" {
  value = alicloud_instance.httpnode1.*.private_ip
  
}