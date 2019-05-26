## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| cloudwatch_name | - | string | - | yes |
| common_tags | - | map | - | yes |
| filter_pattern | description | string | `description` | no |
| log_bucket | - | string | - | yes |
| log_group_name | - | string | `/var/log/messages` | no |
| log_name | - | string | - | yes |
| log_stream | - | string | - | yes |
| region_desc | Region | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| cwlrolearn | - |
| firehosearn | - |

