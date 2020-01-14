output "endpoint_id" {
  description = "Resolver endpoint ID"
  value       = aws_route53_resolver_endpoint.resolver_endpoint.id
}
