variable "instance_name" {
  description = "Name der VM-Instanz"
  type        = string
  default     = "workersrv1"
}

variable "machine_type" {
  description = "Maschinentyp der VM"
  type        = string
  default     = "e2-standard-2"
}

variable "gcloud_zone" {
  description = "Zone der VM"
  type        = string
  default     = "europe-west10-a"
}

variable "gcloud_service_accout" {
  description = "Service-Account der für die VM primär verwendet werden soll"
  type        = string
  default     = "image-puller@gp-dssi.iam.gserviceaccount.com"
}