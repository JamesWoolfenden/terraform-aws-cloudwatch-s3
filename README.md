[![Slalom][logo]](https://slalom.com)

# terraform-aws-cloudwatchtos3 [![Build Status](https://api.travis-ci.com/JamesWoolfenden/terraform-aws-cloudwatchtos3.svg?branch=master)](https://travis-ci.com/JamesWoolfenden/terraform-aws-cloudwatchtos3) [![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-aws-cloudwatchtos3.svg)](https://github.com/JamesWoolfenden/terraform-aws-cloudwatchtos3/releases/latest)

Terraform module to provision infra that collates cloudwatch data into an s3 data lake [`cloudwatch`](https://aws.amazon.com/cloudwatch/).

---

This project 100% Open Source and licensed under the [APACHE2](LICENSE).

## Usage

Include this repository as a module in your existing terraform code:

```hcl
module "cloudwatchtos3" {
  source          = "jameswoolfenden/aws/cloudwatchtos3"
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
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Related Projects

Check out these related projects.

- [terraform-aws-codebuild](https://github.com/jameswoolfenden/terraform-aws-codebuild) - Making a Build pipeline

## Help

**Got a question?**

File a GitHub [issue](https://github.com/jameswoolfenden/terraform-aws-cloudwatchtos3/issues).

## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/jameswoolfenden/terraform-aws-cloudwatchtos3/issues) to report any bugs or file feature requests.

## Copyrights

Copyright © 2019-2019 [Slalom, LLC](https://slalom.com)

## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

<https://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.

### Contributors

|  [![James Woolfenden][jameswoolfenden_avatar]][jameswoolfenden_homepage]<br/>[James Woolfenden][jameswoolfenden_homepage] |
|---|

  [jameswoolfenden_homepage]: https://github.com/jameswoolfenden
  [jameswoolfenden_avatar]: https://github.com/jameswoolfenden.png?size=150

[logo]: https://gist.githubusercontent.com/JamesWoolfenden/5c457434351e9fe732ca22b78fdd7d5e/raw/15933294ae2b00f5dba6557d2be88f4b4da21201/slalom-logo.png
[website]: https://slalom.com
[github]: https://github.com/jameswoolfenden
[linkedin]: https://www.linkedin.com/company/slalom-consulting/
[twitter]: https://twitter.com/Slalom

[share_twitter]: https://twitter.com/intent/tweet/?text=terraform-aws-cloudwatchtos3&url=https://github.com/jameswoolfenden/terraform-aws-cloudwatchtos3
[share_linkedin]: https://www.linkedin.com/shareArticle?mini=true&title=terraform-aws-cloudwatchtos3&url=https://github.com/jameswoolfenden/terraform-aws-cloudwatchtos3
[share_reddit]: https://reddit.com/submit/?url=https://github.com/jameswoolfenden/terraform-aws-cloudwatchtos3
[share_facebook]: https://facebook.com/sharer/sharer.php?u=https://github.com/jameswoolfenden/terraform-aws-cloudwatchtos3
[share_email]: mailto:?subject=terraform-aws-cloudwatchtos3&body=https://github.com/jameswoolfenden/terraform-aws-cloudwatchtos3
