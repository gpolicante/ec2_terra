output "instance_id" { 

value = "${aws_instance.infra.*.id}"


}

