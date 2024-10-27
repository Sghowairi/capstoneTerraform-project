
resource "alicloud_ecs_key_pair" "publickey" {
  key_pair_name = "key"
  key_file = "key.pem"
}
