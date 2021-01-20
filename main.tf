


resource "aws_instance" "infra" {
  count = length(var.name)
  ami           =     (can(regex("^ami-", var.ami)) ? var.ami  : data.aws_ami.std_ami.id )

  instance_type = var.instancetype
  subnet_id = var.subnet[count.index]
  key_name = var.sshkey

 tags       = merge(
 var.tags, 
  { 
      provider = "terraform"
      Name = var.name[count.index]
  }

  )
 
 user_data = (data.template_file.init.rendered)

 vpc_security_group_ids =  var.sg

 root_block_device {
    volume_size = var.size 

    }

# provisioner "remote-exec" { 
#     inline = [
#         "echo ${var.name[count.index]}   > /tmp/batata  "


#     ]
    
# }


}