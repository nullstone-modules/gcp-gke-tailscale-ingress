output "private_urls" {
  value = [
    {
      url = "https://${local.ingress_dns_name}.${local.tailnet_dns_name}"
    }
  ]
}
