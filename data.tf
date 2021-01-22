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
    values =  var.ostype != "" ?  ["${format("%s*", var.ostype)}"] : ["${format("%s*", var.imagedefault)}"]  

}
depends_on = [var.ostype]
}



data "template_file" "init" {
  
  template =  var.playbook_link == ""  ? "${file("${path.module}/init.tpl")}" : "${file("${path.module}/init-playbook.tpl")}"
  vars = { 
      ostype = "${var.ostype} "
      install_debian = "${var.install_debian}"
      install_redhat = "${var.install_redhat}"
      playbook_link = "${var.playbook_link}"
      token_bitly = "${var.token_bitly}"
      
  }
}




