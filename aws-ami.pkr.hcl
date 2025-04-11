packer {
  required_plugins {
    amazon = {
      version = ">= 1.2.8"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "example" {
  region      = "us-east-1"
  source_ami  = "ami-084568db4383264d4"  # 👈 Use your specific base AMI here
  instance_type = "t2.micro"
  ami_name    = "my-custom-ami-{{timestamp}}"

  ssh_username = "ubuntu"  # Make sure this matches the base AMI's default user
}

build {
  name    = "my-ami-build"
  sources = ["source.amazon-ebs.example"]
}
