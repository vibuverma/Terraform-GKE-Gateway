variable "project_id" {
  description = "The project ID to deploy to"
  type        = string
}

variable "gke_cluster" {
  type = object({
    name              = string
    region            = string
    zones             = list(string)
    cluster_ipv4_cidr = string
    vpc = object({
      vpc_name    = string
      vpc_subnet  = string
      vpc_sec_pod = string
      vpc_sec_svc = string
    })
    http_load_balancing        = bool
    network_policy             = bool
    horizontal_pod_autoscaling = bool
    filestore_csi_driver       = bool
    master_authorized_networks = list(object({
      cidr_block   = string
      display_name = string
    }))

    node_pools = list(object({
      name               = string
      machine_type       = string
      node_locations     = list(string)
      min_count          = number
      max_count          = number
      local_ssd_count    = number
      spot               = bool
      disk_size_gb       = number
      disk_type          = string
      image_type         = string
      auto_repair        = bool
      preemptible        = bool
      initial_node_count = number
    }))

    cluster_resource_labels = map(string)
  })
}



#   node_pools = [
#     {
#       name                      = "default-node-pool"
#       machine_type              = "e2-medium"
#       node_locations            = "us-central1-b,us-central1-c"
#       min_count                 = 1
#       max_count                 = 100
#       local_ssd_count           = 0
#       spot                      = false
#       disk_size_gb              = 100
#       disk_type                 = "pd-standard"
#       image_type                = "COS_CONTAINERD"
#       auto_repair               = true
#       preemptible               = false
#       initial_node_count = 1 
#     },
#   ]
