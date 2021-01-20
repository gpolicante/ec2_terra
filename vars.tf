variable "amiid" { 
 type   = string
 default = ""

}
variable "ostype" {
  description = "os type to create"
  type        = string
  default     = ""
}

variable "all" { 
 type   = string
 default = "*"

}

variable "sshkey" { 
 type   = string
 default = ""

}

variable "size" { 
 type   = string
 default = ""

}


variable "instancetype" { 
 type   = string
 default = ""


}

variable "subnet" { 
 type   = list(string)
 default = [""]


}
variable "name" {
  description = "Create IAM users with these names"
  type        = list(string)
  default     = [""]
}

variable "imagedefault" {
  
  type        = string
  default     = "amzn"
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