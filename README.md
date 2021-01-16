# terraform-aws-cloudwatch-s3

[![Build Status](https://github.com/JamesWoolfenden/terraform-aws-cloudwatch-s3/workflows/Verify%20and%20Bump/badge.svg?branch=master)](https://github.com/JamesWoolfenden/terraform-aws-cloudwatch-s3)
[![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-aws-cloudwatch-s3.svg)](https://github.com/JamesWoolfenden/terraform-aws-cloudwatch-s3/releases/latest)
[![GitHub tag (latest SemVer)](https://img.shields.io/github/tag/JamesWoolfenden/terraform-aws-cloudwatch-s3.svg?label=latest)](https://github.com/JamesWoolfenden/terraform-aws-cloudwatch-s3/releases/latest)
![Terraform Version](https://img.shields.io/badge/tf-%3E%3D0.14.0-blue.svg)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/JamesWoolfenden/terraform-aws-cloudwatch-s3/cis_aws)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-aws-cloudwatch-s3&benchmark=CIS+AWS+V1.2)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![checkov](https://img.shields.io/badge/checkov-verified-brightgreen)](https://www.checkov.io/)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/jameswoolfenden/terraform-aws-cloudwatch-s3/general)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-aws-cloudwatch-s3&benchmark=INFRASTRUCTURE+SECURITY)

Terraform module to provision infra that collates cloudwatch data into an s3 data lake [`cloudwatch`](https://aws.amazon.com/cloudwatch/).

---

This project 100% Open Source and licensed under the [APACHE2](LICENSE).

## Usage

Include this repository as a module in your existing terraform code:

```hcl
module "cloudwatch-s3" {
  source          = "jameswoolfenden/aws/cloudwatch-s3"
  version         = "v0.2.20"
  cloudwatch_name = var.cloudwatch_name
  log_bucket      = var.log_bucket
  log_name        = var.log_name
  log_stream      = var.log_stream
  region_desc     = var.region_desc
  filter_pattern  = var.filter_pattern
  common_tags     = var.common_tags
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cloudwatch\_name | n/a | `string` | n/a | yes |
| common\_tags | Implements the common tags scheme | `map` | n/a | yes |
| filter\_pattern | description | `string` | `""` | no |
| kms\_master\_key\_id | kms key id | `string` | `"aws/s3"` | no |
| log\_bucket | n/a | `string` | n/a | yes |
| log\_group\_name | A default log group name | `string` | `"/var/log/messages"` | no |
| log\_name | n/a | `string` | n/a | yes |
| log\_stream | A log stream to watch | `string` | n/a | yes |
| region\_desc | Region | `string` | n/a | yes |
| server\_side\_encryption | Encrypt at rest | `bool` | `false` | no |
| sse\_algorithm | encryption algorithm to use | `string` | `"aws:kms"` | no |

## Outputs

| Name | Description |
|------|-------------|
| cwlrolearn | n/a |
| firehosearn | n/a |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Related Projects

Check out these related projects.

- [terraform-aws-codebuild](https://github.com/jameswoolfenden/terraform-aws-codebuild) - Making a Build pipeline

## Help

**Got a question?**

File a GitHub [issue](https://github.com/jameswoolfenden/terraform-aws-cloudwatch-s3/issues).

## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/jameswoolfenden/terraform-aws-cloudwatch-s3/issues) to report any bugs or file feature requests.

## Copyrights

Copyright © 2019-2021 James Woolfenden

## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements. See the NOTICE file
distributed with this work for additional information
regarding copyright ownership. The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at

<https://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied. See the License for the
specific language governing permissions and limitations
under the License.

### Contributors

[![James Woolfenden][jameswoolfenden_avatar]][jameswoolfenden_homepage]<br/>[James Woolfenden][jameswoolfenden_homepage]

[jameswoolfenden_homepage]: https://github.com/jameswoolfenden
[jameswoolfenden_avatar]: https://github.com/jameswoolfenden.png?size=150
[github]: https://github.com/jameswoolfenden
[linkedin]: https://www.linkedin.com/in/jameswoolfenden/
[twitter]: https://twitter.com/JimWoolfenden
[share_twitter]: https://twitter.com/intent/tweet/?text=terraform-aws-cloudwatch-s3&url=https://github.com/jameswoolfenden/terraform-aws-cloudwatch-s3
[share_linkedin]: https://www.linkedin.com/shareArticle?mini=true&title=terraform-aws-cloudwatch-s3&url=https://github.com/jameswoolfenden/terraform-aws-cloudwatch-s3
[share_reddit]: https://reddit.com/submit/?url=https://github.com/jameswoolfenden/terraform-aws-cloudwatch-s3
[share_facebook]: https://facebook.com/sharer/sharer.php?u=https://github.com/jameswoolfenden/terraform-aws-cloudwatch-s3
[share_email]: mailto:?subject=terraform-aws-cloudwatch-s3&body=https://github.com/jameswoolfenden/terraform-aws-cloudwatch-s3
