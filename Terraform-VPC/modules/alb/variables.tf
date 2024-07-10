variable "sg_id" {
  description = "sg id for application laod balancer"
  type = string
}

variable "subnets" {
    description = "subnets for alb"
    type = list(string) 
}

variable "vpc_id" {
    description = "vpc id for alb"
    type = string
}

variable "instance" {
    description = "insatnce for targate group atachment"
    type = list(string)
}