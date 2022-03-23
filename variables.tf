# variables.tf

#
# provider.tf
#
 
variable "aws_region" {
  description = "Region AWS"
  type        = string
  default     = "us-east-1"
}

#
# instances.tf
#

# claus

variable "key_pair" {
  description = "SSH Key pair used to connect"
  type        = string
  default     = "mykey"
}

# ec2

variable "ami_ec2" {
  description = "ec2 ami"
  type        = string
  default     = "ami-01b996646377b6619"
}

variable "instance_type_ec2" {
  description = "ec2 type"
  type        = string
  default     = "t2.micro"
}

# RDS


variable "storage_type_db" {
  description = "db storage"
  type        = string
  default     = "gp2"
}


variable "engine_type_db" {
  description = "db engine"
  type        = string
  default     = "mysql"
}

variable "engine_version_db" {
  description = "db engine version"
  type        = string
  default     = "5.7.22"
}

variable "instance_type_db" {
  description = "db type"
  type        = string
  default     = "db.t2.micro"
}

variable "name_db" {
  description = "name"
  type        = string
  default     = "javieselmillor"
}


variable "username_db" {
  description = "username"
  type        = string
  default     = "javier"
}

variable "password_db" {
  description = "password"
  type        = string
  default     = "1q2w3e4R"
}

variable "group_db" {
  description = "group de la db"
  type        = string
  default     = "default.mysql5.7"
}

#S3

variable "bucket" {
  description = "buckete"
  type        = string
  default     = "our-chachi-pistachi-bucket"
}


variable "bucket_name" {
  description = "buckete nombre"
  type        = string
  default     = "My chachi backup"
}

variable "bucket_env" {
  description = "buckete entorno"
  type        = string
  default     = "backup"
}




