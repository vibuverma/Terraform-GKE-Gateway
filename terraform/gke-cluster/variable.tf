variable "project_id" {
    description = "The project ID to deploy to"
    type        = string
}

variable "gke_cluster" {
    type = object({
      name = string
      region = string
    })  
}