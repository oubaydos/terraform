resource "google_compute_instance" "cassandra-instance" {
  machine_type = "e2-standard-2"
  name         = "cassandra-instance"
#  zone         = "europe-west9-a"
  tags = ["cassandra"]
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      size  = 20
    }
  }
  network_interface {
    network = "default"
    access_config {
      network_tier = "PREMIUM"
    }
  }
  metadata = {
    startup-script = "${file("scripts/cassandra.sh")}"
  }
}
output "cassandra_ip" {
  value = google_compute_instance.cassandra-instance.network_interface.0.access_config.0.nat_ip
}