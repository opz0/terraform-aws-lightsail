# Terraform-aws-lightsail

# AWS Infrastructure Provisioning with Terraform
## Table of Contents
- [Introduction](#introduction)
- [Usage](#usage)
- [Module Inputs](#module-inputs)
- [Module Outputs](#module-outputs)
- [Examples](#examples)
- [License](#license)

## Introduction
This Terraform module is designed to provision AWS resources using the AWS provider. It includes the creation of a Virtual Private Cloud (VPC), public subnets, IAM roles, and EC2 instances. This module facilitates infrastructure as code (IaC) for AWS environments.

## Usage
To use this module, you should have Terraform installed and configured for AWS. This module provides the necessary Terraform configuration for creating AWS resources, and you can customize the inputs as needed. Below is an example of how to use this module:
# Examples

# Example: example

```hcl
module "lightsail" {
  source      = "git::https://github.com/opz0/terraform-aws-lightsail.git?ref=v1.0.0"

  environment = "test"
  name        = "lightsail"
  label_order = ["name", "environment"]

  public_key           = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCzJVDK2umFR7a47ebFhIapr00fh6KZVpMFxOp9CRn7AQQdwN7mjm+NWT7LsyKo0i5bLeHpo5Iqu4QoN1Ld1abG4wq7kMhJVC8E6+dPej5SlqyXaXIZOOfdu9zOaDAH2urEodKa+m8H4qf7vYZqhhWdCrS9gW8IAvN08jvw+BKweUIvgAJvx/t6JLyhEV1gqbcRq2Fz3S3OVLTmLclWn+bwugjYSOcHGc2qVrVd4Tar8RjvQl32aNkscutdbVgaE1mnFMQz0kTZ2a78lfI7od10UMnCj1Fjf5wdYzT60CXJ6wLFto/nko5TpZwIzjsMXen1Tp0Futr4efz8fPjdtM568sV0ZL4ltJPypComy3/PiyGRz7BdJ1VCco1g/pH+vteQ4CjOTfmL+8Z7/DLJ04soUVrSqTHl/l/FcG4cO3x2rNJxNTQGqLCvXBXEDfQKpQR/zpS0wotoF1FN3eKkgifzcM1T1zLwKyaOnukbnzTZTAZjA6mtjK/BTcoU0ElzHYU= satish@satish"
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
## Example

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

## Examples
You can find more usage examples and configurations in the source code of each module, which are available

## License
This Terraform module is provided under the '[License Name]' License. Please see the [LICENSE](https://github.com/opz0/terraform-aws-lightsail/blob/master/LICENSE) file for more details.

## Author
Your Name
Replace '[License Name]' and '[Your Name]' with the appropriate license and your information. Feel free to expand this README with additional details or usage instructions as needed for your specific use case.
