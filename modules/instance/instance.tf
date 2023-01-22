
resource "google_compute_instance" "temp-instance"{
  name         = "terraform-instance"
  machine_type = "e2-standard-2"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      size = 20
    }
  }
  network_interface {
    # A default network is created for all GCP projects
    network = "default"
    access_config {
      network_tier = "PREMIUM"
    }
  }
  metadata = {
    ssh-keys = "oubay:${file("ssh-key.pub")}",
    startup-script = "${file("scripts/kubernetes.sh")}"
  }

}
output "instanceip" {
  value = google_compute_instance.temp-instance.network_interface.0.access_config.0.nat_ip
}