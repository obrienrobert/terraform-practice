variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "ExampleAppServerInstance"
}

variable "region" {
  type    = list(string)
  default = ["us-east-1"]
}

variable "zone" {
  type    = list(string)
  default = ["us-east-1a"]
}

variable "user_data" {
  type    = string
  default = <<-EOF
  #!/bin/bash -ex
  amazon-linux-extras install nginx1 -y
  echo "<h1>$(curl https://api.kanye.rest/?format=text)</h1>" >  /usr/share/nginx/html/index.html
  systemctl enable nginx
  systemctl start nginx
  EOF
}

variable "key_name" {
  type    = string
  default = "MyKeyPair"
}

variable "tag_prefix" {
  type    = string
  default = "test-"
}
