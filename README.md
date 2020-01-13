# terraform-aws-route53-endpoint
[![](https://github.com/rhythmictech/terraform-aws-route53-endpoint/workflows/check/badge.svg)](https://github.com/rhythmictech/terraform-aws-route53-endpoint/actions)

Create and manage a [Route 53 Resolver Endpoint](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/resolver-getting-started.html).

## Usage
```
module "route53-inbound" {
  source            = "git::https://github.com/rhythmictech/terraform-aws-route53-endpoint"
  allowed_resolvers = ["192.168.100.0/24"]
  direction         = "inbound"
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
  vpc_id            = module.vpc.vpc_id

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

| Name               | Description |     Type     | Default | Required |
| ------------------ | ----------- | :----------: | :-----: | :------: |
| additional\_tags   |             | map(string)  |  `{}`   |    no    |
| allowed\_resolvers |             | list(string) |  `[]`   |    no    |
| direction          |             |    string    |   n/a   |   yes    |
| env                |             |    string    |   n/a   |   yes    |
| ip\_addresses      |             |    object    |   n/a   |   yes    |
| namespace          |             |    string    |   n/a   |   yes    |
| owner              |             |    string    |   n/a   |   yes    |
| region             |             |    string    |   n/a   |   yes    |
| vpc\_id            |             |    string    | `"vpc"` |    no    |

## Outputs

| Name         | Description |
| ------------ | ----------- |
| endpoint\_id |             |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Related Projects
* [Route 53 Resolver Rule module](https://github.com/rhythmictech/terraform-aws-route53-resolver-rule)
