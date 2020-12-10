resource "local_file" "ansible_hosts" {
  content     = <<EOF
[app]
${scaleway_instance_server.app.public_ip}
[app]
${scaleway_instance_server.app.id}
[db_server]
${scaleway_instance_server.db.public_ip}
[db_server]
${scaleway_instance_server.db.id}
  EOF
  filename = "${path.module}/inventory"
}
