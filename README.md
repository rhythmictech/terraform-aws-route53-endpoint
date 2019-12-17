# terraform-aws-route53-endpoint
[![](https://github.com/rhythmictech/terraform-aws-route53-endpoint/workflows/check/badge.svg)](https://github.com/rhythmictech/terraform-aws-route53-endpoint/actions)


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| additional\_tags |  | map(string) | `{}` | no |
| allowed\_resolvers |  | list(string) | `[]` | no |
| direction |  | string | n/a | yes |
| env |  | string | n/a | yes |
| ip\_addresses |  | object | n/a | yes |
| namespace |  | string | n/a | yes |
| owner |  | string | n/a | yes |
| region |  | string | n/a | yes |
| vpc\_id |  | string | `"vpc"` | no |

## Outputs

| Name | Description |
|------|-------------|
| endpoint\_id |  |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
