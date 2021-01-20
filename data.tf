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
    values =  var.ami != "" ?  ["${format("%s*", var.ami)}"] : ["nada"] 

}
depends_on = [local.getimage]
}



data "template_file" "init" {
  
  template = "${file("${path.module}/init.tpl")}"
  vars = { 
      
      install_debian = "${var.install_debian}"
      install_redhat = "${var.install_redhat}"
      playbook_link = "${var.playbook_link}"
      token_bitly = "${var.token_bitly}"
      
  }
}




