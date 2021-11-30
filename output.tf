### The Ansible inventory file
resource "local_file" "AnsibleInventory" {
  content = templatefile("inventory.tpl", {
    web-ip = aws_instance.web.*.private_ip
    db-ip = aws_instance.db.*.private_ip
  })
  filename = "inventory"
}

