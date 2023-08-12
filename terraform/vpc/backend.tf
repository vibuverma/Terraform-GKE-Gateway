terraform {
  backend "gcs" {
    bucket = "proj-terraform-statefile"
    # prefix = "terraform/<project-id>/<resource-name>/state"
    prefix = "terraform/project-id/vpc/state"
  }
}