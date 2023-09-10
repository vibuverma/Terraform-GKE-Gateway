resource "google_compute_instance" "jenkins" {
  name         = "${format("%s","${var.bu}-${var.env}-instance1")}"
  machine_type  = "n1-standard-1"
  zone          = var.region
  tags          = ["jenkins-instance"]
  boot_disk {
    initialize_params {
      image     =  "debian-10-buster-v20230809"     
    }
  }
labels {
      webserver =  "true"     
    }
metadata {
        startup-script = <<SCRIPT
        curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
        echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
        sudo apt-get update
        sudo apt-get install jenkins
        SCRIPT
    } 
network_interface {
    subnetwork = var.subnet_name
    access_config {
      // Ephemeral IP
    }
  }
}