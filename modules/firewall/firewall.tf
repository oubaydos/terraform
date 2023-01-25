resource "google_compute_firewall" "cassandra_rules" {
  name    = "cassandra-rules"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["9042", "7000"]
  }
#  source_tags   = ["cassandra"]
#  i dont know which tags i should use
  target_tags   = ["cassandra"]
  source_ranges = ["0.0.0.0/0"]
}