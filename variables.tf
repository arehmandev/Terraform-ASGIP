### Provider
variable "adminregion" {}

variable "adminprofile" {}

variable "key_name" {}

variable "public_key_path" {
  default = "~/.ssh/id_rsa.pub"

  description = <<DESCRIPTION
Path to the SSH public key for authentication.
Example: ~/.ssh/id_rsa.pub
DESCRIPTION
}

variable "certauthbucket" {}

variable "etcdbucket" {}
