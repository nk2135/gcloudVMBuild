resource "google_compute_instance" "default" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone
  

  // ... (rest of your configuration)

  boot_disk {
    initialize_params {
      image = "image-1"
      size  =  var.boot_disk
      labels = {
        my_label = "value"
      }
    }
   
}
 network_interface {
    network = "default"
    access_config {
      // This block assigns an external IP to the NIC
    }
    }
}



