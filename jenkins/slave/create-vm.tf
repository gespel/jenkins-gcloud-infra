provider "google" {
  project = "gp-dssi"
  region  = "europe-west10"
  //zone    = var.gcloud_region
}

resource "google_compute_instance" "srv1" {
  count        = 1
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.gcloud_zone

  scheduling {
    preemptible       = true
    automatic_restart = false # Bei preemptible muss dies auf false gesetzt sein
  }

  boot_disk {
    initialize_params {
      image = "opensuse-leap-15-6-v20241004-x86-64"
    }
  }

  network_interface {
    network = "default"
  }
  service_account {
    email  = var.gcloud_service_accout
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    # Aktivieren des Schreibmodus für das Root-Dateisystem
    mount -o remount,rw /
    curl -sSO https://dl.google.com/cloudagents/add-google-cloud-ops-agent-repo.sh
    sudo bash add-google-cloud-ops-agent-repo.sh --also-install
    sudo snap install docker
  EOT

  tags = ["jenkins-slave"]
}