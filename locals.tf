locals { 

getimage = can(regex("^Ubuntu", var.ami)) 

}