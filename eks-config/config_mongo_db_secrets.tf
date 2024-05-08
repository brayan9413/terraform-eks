#--------------------------------------------------------------------
# - Mongo DB URI secrets per application and user
#--------------------------------------------------------------------
resource "kubernetes_secret" "mongo_uri_secret" {
  for_each = { for idx, user in local.mongodb_users : idx => user }

  metadata {
    name = "mongo-uri-secret-${each.value}"
  }

  data = {
    MONGO_URI = "mongodb://${each.value}:${local.mongodb_passwords[each.key]}@mongodb.mongodb.svc.cluster.local:27017/?authSource=${local.databases_list[each.key]}"
  }
}
