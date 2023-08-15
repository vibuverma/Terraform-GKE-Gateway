project_id = "perosnal-project"
gke_cluster = {
  name              = "private-cluster"
  region            = "asia-south1"
  zones             = ["asia-south1-a", "asia-south1-b", "asia-south1-c"]
  cluster_ipv4_cidr = "10.20.0.0/21"
  vpc = {
    vpc_name    = "value"
    vpc_subnet  = "value"
    vpc_sec_pod = "value"
    vpc_sec_svc = "value"
  }
  http_load_balancing        = false
  network_policy             = false
  horizontal_pod_autoscaling = false
  filestore_csi_driver       = false
  master_authorized_networks = [{
    cidr_block   = "192.168.0.0/21"
    display_name = "vpn cidr"
  }]
  node_pools = [{
    name               = "linux-pool-01"
    machine_type       = "e2-standard-8"
    node_locations     = "asia-south1-b"
    min_count          = 1
    max_count          = 100
    local_ssd_count    = 0
    spot               = false
    disk_size_gb       = 200
    disk_type          = "pd-standard"
    image_type         = "COS_CONTAINERD"
    auto_repair        = true
    preemptible        = false
    initial_node_count = 1
  }]
  cluster_resource_labels = {
    project = "personal-project"
  }

}
