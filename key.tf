
resource "alicloud_ecs_key_pair" "key" {
  key_pair_name = "keycapstone"
  key_file = "keycapstone.pem"
}
