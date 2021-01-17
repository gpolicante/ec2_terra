data "aws_ami" "std_ami" {
  most_recent = true
  owners      = ["amazon"]

filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }


filter { 
    name = "name"
    values =  var.ostype != "" ?  ["${format("%s*", var.ostype)}"] : ["amzn"]

}
}

data "template_file" "init" {
  template = "${file("${path.module}/init.tpl")}"
  vars = { 
      ostype = "${var.ostype} "
      install_debian = "${var.install_debian}"
      install_redhat = "${var.install_redhat}"
      hostname = "${var.name}"
  }
}

