data "ns_connection" "tailscale_operator" {
  name     = "tailscale-operator"
  contract = "block/gcp/tailscale"
}

locals {
  tailnet_dns_name = data.ns_connection.tailscale_operator.outputs.tailnet_dns_name
}
