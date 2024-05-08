#--------------------------------------------------------------------
# - Mongo DB helm release
# MongoDB is a NoSQL database that stores data in flexible, JSON-like documents 
# It is known for its scalability, flexibility, and ease of use
# - https://artifacthub.io/packages/helm/bitnami/mongodb
#--------------------------------------------------------------------
resource "kubernetes_namespace" "mongodb" {
  metadata {
    name = "mongodb"
  }
}

resource "helm_release" "mongodb" {
  depends_on = [kubernetes_namespace.mongodb]

  name       = "mongodb"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "mongodb"
  namespace  = "mongodb"

  set_list {
    name  = "auth.databases"
    value = ["test_database"]
  }

  set_list {
    name  = "auth.usernames"
    value = jsondecode(var.mongodb_users)
  }

  set_list {
    name  = "auth.passwords"
    value = jsondecode(var.mongodb_passwords)
  }

  set {
    name  = "architecture"
    value = "standalone" # The standalone architecture installs a deployment (or StatefulSet) with one MongoDB® server (it cannot be scaled):
  }

  set {
    name  = "useStatefulSet" # Set to true to use a StatefulSet instead of a Deployment (only when architecture=standalone)
    value = true
  }
}
