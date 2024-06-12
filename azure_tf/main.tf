#  Example `main.tf`:
# The configuration for the `remote` backend.

terraform {
  required_providers {
    local = {
           source = "hashicorp/local"
           version = "2.5.1"
    }
  }
}

provider "local" {
  # Configuration options
}

resource "local_file" "sample_file" {
  content  = "foo!"
  filename = "${path.module}/foo.bar"
}
