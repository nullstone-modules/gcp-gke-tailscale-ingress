resource "kubernetes_ingress_v1" "this" {
  metadata {
    namespace = local.kubernetes_namespace
    name      = local.resource_name

    labels = {
      "app.kubernetes.io/name"       = local.block_name
      "app.kubernetes.io/version"    = ""
      "app.kubernetes.io/component"  = ""
      "app.kubernetes.io/part-of"    = data.ns_workspace.this.stack_name
      "app.kubernetes.io/managed-by" = "nullstone"

      "nullstone.io/stack" = data.ns_workspace.this.stack_name
      "nullstone.io/block" = data.ns_workspace.this.block_name
      "nullstone.io/env"   = data.ns_workspace.this.env_name
    }
  }

  spec {
    ingress_class_name = "tailscale"

    tls {
      hosts = ["${local.service_name}-${local.env_name}-${local.stack_name}"]
    }

    default_backend {
      service {
        name = local.service_name
        port {
          number = local.service_port
        }
      }
    }
  }
}
