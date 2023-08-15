variable "project_id" {
  description = "The project ID to deploy to"
  type        = string
}

variable "gke_cluster" {
  type = object({
    name   = string
    region = string
    zones  = list(string)
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
#       enable_gcfs               = false
#       enable_gvnic              = false
#       auto_repair               = true
#       auto_upgrade              = true
#       service_account           = "project-service-account@<PROJECT ID>.iam.gserviceaccount.com"
#       preemptible               = false
#       initial_node_count        = 80
#     },
#   ]