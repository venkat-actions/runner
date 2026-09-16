resource "aws_instance" "runner"{
    ami= local.ami_id
    instance_type= "t3.micro"
    vpc_security_group_ids= [aws_security_group.allow_all.id]
    root_block_device{
        volume_size= 50
        volume_type= "gp3"
    }
    user_data= file("runner.sh")
    tags={
        Name= local.final_name
    }
}

resource "aws_security_group" "allow_all"{
    name= "${var.project}-${var.environment}"
    description= "this sg for allowing all the protocols"
    ingress{
        from_port= "0"
        to_port= "0"
        protocol= "-1"
        cidr_blocks= ["0.0.0.0/0"]
    }
    egress{
        from_port= "0"
        to_port= "0"
        protocol= "-1"
        cidr_blocks= ["0.0.0.0/0"]
    }
    tags={
        Name= local.final_name
    }
}
