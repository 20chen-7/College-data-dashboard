variable "credentials" {
  description = "My Credentials"
  default     = "./key/my-creds.json"
}


variable "location" {
  description = "Project Location"
  default     = "US"
}

variable "region" {
  description = "Project Region"
  default     = "us-central1"
}
# us-central1
variable "project" {
  description = "Project"
  default     = "de-bootcamp-final-project"
}

variable "bq_dataset_name" {
  description = "My BigQuery Dataset For Collage"
  default     = "college_dataset_ivy"
}

variable "gcs_bucket_name" {
  description = "My Storage Bucket Name"
  default     = "college-scorecard-data-2024-04"
}

variable "gcs_storage_class" {
  description = "Bucket Storage Class"
  default     = "STANDARD"

}