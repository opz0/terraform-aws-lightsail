# Terraform-aws-lightsail

# AWS Infrastructure Provisioning with Terraform
## Table of Contents
- [Introduction](#introduction)
- [Usage](#usage)
- [Module Inputs](#module-inputs)
- [Module Outputs](#module-outputs)
- [Example](#example)
- [License](#license)

## Introduction
This module is basically combination of Terraform open source and includes automatation tests and examples. It also helps to create and improve your infrastructure with minimalistic code instead of maintaining the whole infrastructure code yourself.

## Usage
To use this module, you should have Terraform installed and configured for AWS. This module provides the necessary Terraform configuration for creating AWS resources, and you can customize the inputs as needed. Below is an example of how to use this module:
# Example

```hcl
module "lightsail" {
  source      = "git::https://github.com/cypik/terraform-aws-lightsail.git?ref=v1.0.0"

  environment = "test"
  name        = "lightsail"
  label_order = ["name", "environment"]

  public_key           = "sshJXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXbnzTZTAZjA6mtjK/BTcoU0ElzHYU= satish@satish"
  use_default_key_pair = true
  user_data            = file("${path.module}/lightsail.sh")

  port_info = [
    {
      port     = 80
      protocol = "tcp"
      cidrs    = ["0.0.0.0/0"]
    },
    {
      port     = 22
      protocol = "tcp"
      cidrs    = ["0.0.0.0/0"]
    }
  ]
}
```

This example demonstrates how to create various AWS resources using the provided modules. Adjust the input values to suit your specific requirements.

## Module Inputs
- 'name'       : The name for the bucket.
- 'environment':  The environment for the resources.
- 'label_order':  The order of labels for naming resources.

  For security group settings, you can configure the ingress and egress rules using variables like:

## Module Outputs
- `arn`: The ARN of the lightsail bucket.
- `created_at`:The timestamp when the bucket was created.
- Other relevant security group outputs (modify as needed).

## Example
You can find more usage examples and configurations in the [examples](https://github.com/cypik/terraform-aws-lightsail/tree/master/example) source code of each module, which are available

## License
This Terraform module is provided under the '[License Name]' License. Please see the [LICENSE](https://github.com/cypik/terraform-aws-lightsail/blob/master/LICENSE) file for more details.

## Author
Your Name
Replace '[License Name]' and '[Your Name]' with the appropriate license and your information. Feel free to expand this README with additional details or usage instructions as needed for your specific use case.
