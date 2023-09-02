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

resource "google_storage_bucket" "bucket" {
  name     = "gcp_bucket_258964"
  location = "us"
  project  = "smooth-league-275317"
  force_destroy = true

  // Uncomment below line to make bucket data private
  // uniform_bucket_level_access = true

  // Uncomment to enable versioning
  // versioning {
  //   enabled = true
  // }
}

resource "google_compute_disk" "pbm02d1disk001" {
	name	= 	"pbm01d1disk001"
	type   	= 	"pd-ssd"
	size	= 	100
	zone	= 	"us-central1-a"
	physical_block_size_bytes = 4096
    
}

//Create New Disk and Attach to testvm1238 VM
resource "google_compute_instance" "testvm12389" {
	name		=	"testvm12389"
	machine_type	=	"e2-micro"
	zone		=	"us-central1-b"
	
	boot_disk {
		initialize_params {
			image 	=	"windows-server-2012-r2-dc-v20230621"
		}
	}

	network_interface {
		network = "default"
		
	access_config {
		//Ephemeral IP
		}	
	}

	attached_disk {
		source	=	google_compute_disk.pbm02d1disk001.self_link
	}
}
