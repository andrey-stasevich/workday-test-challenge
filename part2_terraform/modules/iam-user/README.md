# Descritpion
This module creates IAM users: sytem or human. Determination is done by `system` variable. System users does not have login credentials, while API keys are created for each kind.
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_access_key.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key) | resource |
| [aws_iam_user.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_login_profile.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_login_profile) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | User name | `string` | n/a | yes |
| <a name="input_pgp_key"></a> [pgp\_key](#input\_pgp\_key) | PGP Key for user creation | `string` | `"keybase:test"` | no |
| <a name="input_system"></a> [system](#input\_system) | Determines whether the user is system or human | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_user_arn"></a> [user\_arn](#output\_user\_arn) | n/a |
