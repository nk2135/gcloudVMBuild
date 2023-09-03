resource "google_compute_instance" "default" {
  name         = "testvm1238"
  machine_type = "f1-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "windows-server-2012-r2-dc-v20230621"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }
}



