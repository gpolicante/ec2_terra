# terraform {
#       experiments = [variable_validation]
#     }

variable "amiid" { 
 type   = string
 default = ""

}

variable "ostype" { 
 type   = string
 default = ""

}


# variable "all" { 
#  type   = string
#  default = "*"

# }

variable "sshkey" { 
 type   = string
 default = ""
 
validation { 

condition = ( var.sshkey != "" ) 
error_message = "Do you need  sshkey."

}

}

variable "size" { 
 type   = string
 default = ""

validation { 

condition = ( var.size != "" ) 
error_message = "Do you need  pass size to ssd."

}

}


variable "instancetype" { 
 type   = string
 default = ""

validation { 

condition = ( var.instancetype != "")



error_message = "Instance type not null."

}

}

variable "subnet" { 
 type   = list(string)
 default = [""]

validation { 

condition = ( var.subnet != ""   || 
              can(regex("^subnet-", var.subnet))


)


error_message = "Subnet not null or not initial with subnet-."

}

}
variable "name" {
  description = "Create  users"
  type        = list(string)
  default     = [""]
validation { 

condition = ( var.name != "" )



error_message = "Name parameter is name to instance not null."

}


}




variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = { 

  }



}

variable "sg" { 
 type   = list(string)
 default = [""]

validation { 

condition = ( var.sg != ""   || 
              can(regex("^sg-", var.sg))


)



error_message = "Sg not null or not initial with sg-."

}

}

variable "install_debian" { 
 type   = string
 default = "apt"

}

variable "install_redhat" { 
 type   = string
 default = "yum"

}

variable "playbook_link" { 
 type   = string
 default = ""



}

variable "token_bitly" { 
 type   = string
 default = ""



}
