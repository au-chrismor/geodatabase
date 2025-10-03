variable "api_country_count_name" {
    type = string
    default = "country_count"
}

variable "app_subnets" {
    type = list(string)
}

variable "aws_access_key" {
    type = string
}

variable "aws_account" {
  type = string
}

variable "aws_region" {
    type = string
}

variable "aws_secret_key" {
    type = string
}

variable "db_availability_zone" {
    type = string
}

variable "db_instance_size" {
    type = string
    default = "db.t4g.micro"
}

variable db_max_storage {
  type = number
  default = 100
}

variable db_min_storage {
  type = number
  default = 20
}

variable db_port {
  type = number
  default = 5432
}

variable db_source_snapshot {
  type = string
}

variable db_subnets {
    type = list(string)
}

variable "db_user_name" {
    type = string
}

variable "db_password" {
    type = string
}

variable "db_skip_snapshot" {
  type = bool
  default = true
}

variable "environment" {
    type = string
}

variable "lambda_runtime_file" {
  type = string
}

variable "lambda_extension_arn" {
  type = string
}

variable "owner" {
    type = string
}

variable "project" {
    type = string
}

variable "version_id" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "vpc_id" {
  type = string
}
