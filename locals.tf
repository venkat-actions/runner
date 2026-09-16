locals{
    ami_id= data.aws_ami.rhel9.id
    final_name= "${var.project}-${var.environment}"
}