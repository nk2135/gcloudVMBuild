resource "google_compute_instance" "default" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone
  osdisk       = var.boot_disk

  // ... (rest of your configuration)
}



