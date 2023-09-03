resource "google_compute_instance" "default" {
  name         = ""
  machine_type = ""
  zone         = ""

  boot_disk {
    initialize_params {
      image = ""
    }
  }

  network_interface {
    network = ""

    access_config {
      // Ephemeral IP
    }
  }
}

resource "google_storage_bucket" "bucket" {
  name     = ""
  location = ""
  project  = ""
  force_destroy = true

  // Uncomment below line to make bucket data private
  // uniform_bucket_level_access = true

  // Uncomment to enable versioning
  // versioning {
  //   enabled = true
  // }
}

resource "google_compute_disk" "pbm02d1disk001" {
	name	= 	""
	type   	= 	""
	size	= 	
	zone	= 	""
	physical_block_size_bytes = 
    
}

//Create New Disk and Attach to testvm1238 VM
resource "google_compute_instance" "testvm12389" {
	name		=	""
	machine_type	=	""
	zone		=	""
	
	boot_disk {
		initialize_params {
			image 	=	""
		}
	}

	network_interface {
		network = ""
		
	access_config {
		//Ephemeral IP
		}	
	}

	attached_disk {
		source	=	google_compute_disk.pbm02d1disk001.self_link
	}
}
