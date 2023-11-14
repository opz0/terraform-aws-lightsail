provider "aws" {
  region = "us-east-1"
}

module "lightsail" {
  source = "../"

  environment = "test"
  name        = "lightsail"
  label_order = ["name", "environment"]

  public_key           = "ssh+NWT7LsyXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXvYZqhhWdCrS9gW8IAvN08jvw+BKweUIvgAJvx/t6JLyhEV1gqbcRq2Fz3S3OVLTmLclWn+bwugjYSOcHGc2qVrVd4Tar8RjvQl32aNkscutdbVgaE1mnFMQz0kTZ2a78lfI7od10UMnCj1Fjf5wdYzT60CXJ6wLFto/nko5TpZwIzjsMXen1Tp0Futr4efz8fPjdtM568sV0ZL4ltJPypComy3/PiyGRz7BdJ1VCco1g/pH+vteQ4CjOTfmL+8Z7/DLJ04soUVrSqTHl/l/FcG4cO3x2rNJxNTQGqLCvXBXEDfQKpQR/zpS0wotoF1FN3eKkgifzcM1T1zLwKyaOnukbnzTZTAZjA6mtjK/BTcoU0ElzHYU= satish@satish"
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
