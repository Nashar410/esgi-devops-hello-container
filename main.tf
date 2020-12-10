provider "scaleway" {
  access_key = var.access_key
  organization_id = var.organization_id
  region          = "fr-par"
  zone            = "fr-par-1"
}

resource "scaleway_instance_ip" "app_ip" {}
resource "scaleway_instance_server" "app" {
  type  = "DEV1-S"
  image = "docker"
  name  = "app"

  ip_id = scaleway_instance_ip.app_ip.id

}

resource "scaleway_instance_ip" "db_ip" {}
resource "scaleway_instance_server" "db" {
  type  = "DEV1-S"
  image = "docker"
  name  = "db"

  ip_id = scaleway_instance_ip.db_ip.id

}
