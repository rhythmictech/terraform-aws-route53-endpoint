# terraform-aws-route53-endpoint
[![](https://github.com/rhythmictech/terraform-aws-route53-endpoint/workflows/check/badge.svg)](https://github.com/rhythmictech/terraform-aws-route53-endpoint/actions)

Create and manage a [Route 53 Resolver Endpoint](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/resolver-getting-started.html).

## Usage
```
module "route53-inbound" {
  source            = "git::https://github.com/rhythmictech/terraform-aws-route53-endpoint"
  allowed_resolvers = ["192.168.100.0/24"]
  direction         = "inbound"
  name              = "corporate-vpn"
  vpc_id            = "vpc-1234567"

  ip_addresses      = [
    {
      ip        = "172.30.1.10"
      subnet_id = "subnet-1234567a"
    },
    {
      ip        = "172.30.2.10"
      subnet_id = "subnet-1234567b"
    }
  ]
}

module "route53-outbound" {
  source            = "git::https://github.com/rhythmictech/terraform-aws-route53-endpoint"
  allowed_resolvers = ["192.168.100.10/32", "192.168.100.11/32"]
  direction         = "outbound"
  vpc_id            = "vpc-1234567"

  ip_addresses      = [
    {
      subnet_id = "subnet-1234567a"
    },
    {
      subnet_id = "subnet-1234567b"
    }
  ]
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| allowed\_resolvers | List of allowed CIDRs. For inbound endpoints, this should be the list of CIDRs allowed to query. For outbound endpoints, this should be the list of DNS servers the endpoint will talk to. | `list(string)` | `[]` | no |
| direction | Specify inbound or outbound for type of resolver endpoint | `string` | n/a | yes |
| dns\_port | Port used by DNS | `number` | `53` | no |
| ip\_addresses | Specify subnets and IP addresses to use for your endpoints. subnet\_id is mandatory, ip is optional | `list(map(any))` | n/a | yes |
| name | Friendly name of the endpoint | `string` | null | no |
| tags | Tags to apply to created resources | `map(string)` | `{}` | no |
| vpc\_id | VPC ID to place resolver endpoints in | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| endpoint\_id | Resolver endpoint ID |
| security\_group\_id | Resolver endpoint security group ID |
| ip\_addresses | Resolver IP addresses in your VPC that you want DNS queries to pass through |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Related Projects
* [Route 53 Resolver Rule module](https://github.com/rhythmictech/terraform-aws-route53-resolver-rule)
