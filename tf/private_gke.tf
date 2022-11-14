resource "google_container_cluster" "my-private-cluster" {
  name               = "my-private-cluster"
  location = "asia-east1-a"
  node_locations = "asia-east1-a"
  network = google_compute_network.my-vpc.id
  remove_default_node_pool = true
  initial_node_count = 3
#   addons_config {
#     http_load_balancing {
#       disabled = false
#     }

#     kubernetes_dashboard {
#       disabled = true
#     }
#   }

#   private_cluster_config {
#     master_ipv4_cidr_block = "172.16.0.0/28"
#     enable_private_nodes   = true
#   }

#   # Disable Basic Auth
#   master_auth {
#     username = ""
#     password = ""
#   }

#   # Kubernetes master's external IP is only accessible from ${var.kubernetes_master_allowed_ip}
#   master_authorized_networks_config {
#     cidr_blocks = [
#       {
#         cidr_block = "${var.k8s_master_allowed_ip}/32"
#       },
#     ]
#   }

#   # Use ABAC until official Kubernetes plugin supports RBAC
#   enable_legacy_abac = "true"

#   # Enable alias IP addresses https://cloud.google.com/kubernetes-engine/docs/how-to/alias-ips
#   ip_allocation_policy {
#     create_subnetwork = true
#     subnetwork_name   = "${var.network_name}"
#   }

#   lifecycle {
#     ignore_changes = ["node_pool"]
#   }

#   node_pool {
#     name = "default-pool"
#   }
# }

resource "google_container_node_pool" "my-pool" {
  name       = "my-pool"
  cluster    = google_container_cluster.my-private-cluster.name
  location   =  "asia-east1-a"
  node_count = 3
  max_pods_per_node = 30


#   management {
#     auto_repair  = true
#     auto_upgrade = true
#   }

 node_config {
    #preemptible  = true
    machine_type = "n1-standard-1"

    service_account = google_service_account.clustersa.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}