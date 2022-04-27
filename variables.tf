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
#cloudwatch
variable "logs_path" {
  description = "Path of the logs in CloudWatch"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Resource tags"
}

#cloudwatch logs
variable "log_group_retention_in_days" {
  description = "Por defecto puesto en 30 días."
  type        = number
  default     = 30
}

variable "log_group_kms_key_id" {
  description = "Encriptador KMS para el ARN."
  default     = ""
}
