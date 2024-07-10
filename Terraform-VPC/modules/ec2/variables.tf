variable "sg_id" {
    description = "sg id for EC2 instance"
    type = string
}

variable "subnets" {
    description = "sbubnet for EC2 instance"
    type = list(string)
}

variable "ec2_names" {
    description = "this is ec2 names"
    type = list(string)
    default = ["webserver1", "webserver2"]
}