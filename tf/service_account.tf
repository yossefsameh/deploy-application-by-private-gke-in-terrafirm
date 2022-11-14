resource "google_service_account" "clustersa" {
  account_id   = "clustersa"
  display_name = "clustersa"
}

resource "google_project_iam_binding" "my-iam-binding" {
    role = "roles/container.admin"
    project     = "youssefs-project-367822"

    members = [
      "serviceAccount:clustersa@youssefs-project-367822.iam.gserviceaccount.com",

    ]
  
}
