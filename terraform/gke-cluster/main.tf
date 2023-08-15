# google_client_config and kubernetes provider must be explicitly specified like the following.
data "google_client_config" "default" {}

data "google_project" "service_project" {
  project_id = var.project_id
}

provider "kubernetes" {
  host                   = "https://${module.gke.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.gke.ca_certificate)
}

module "gke" {
  source                     = "terraform-google-modules/kubernetes-engine/google"
  project_id                 = var.project_id
  name                       = var.gke_cluster.name
  region                     = var.gke_cluster.region
  zones                      = var.gke_cluster.zones
  network                    = var.gke_cluster.vpc.vpc_name
  subnetwork                 = var.gke_cluster.vpc.vpc_subnet
  ip_range_pods              = var.gke_cluster.vpc.vpc_sec_pod
  ip_range_services          = var.gke_cluster.vpc.vpc_sec_svc
  http_load_balancing        = var.gke_cluster.http_load_balancing
  network_policy             = var.gke_cluster.network_policy
  horizontal_pod_autoscaling = var.gke_cluster.horizontal_pod_autoscaling
  filestore_csi_driver       = var.gke_cluster.filestore_csi_driver
  cluster_ipv4_cidr          = var.gke_cluster.cluster_ipv4_cidr
  remove_default_node_pool   = true
  create_service_account     = false
  master_authorized_networks = var.gke_cluster.master_authorized_networks
  node_pools                 = var.gke_cluster.node_pools
  node_pools_labels          = var.gke_cluster.node_pools_labels
  cluster_resource_labels    = var.gke_cluster.cluster_resource_labels
  depends_on                 = [google_compute_subnetwork_iam_member.member]
}


resource "google_compute_subnetwork_iam_member" "member" {
  project    = var.project_id
  region     = var.gke_cluster.region
  subnetwork = var.gke_cluster.vpc.vpc_subnet
  role       = "roles/compute.networkUser"
  member     = format("serviceAccount:%s@cloudservices.gserviceaccount.com", data.google_project.service_project.number)
}
