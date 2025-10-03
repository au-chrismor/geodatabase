output "parameter_db_name" {
  value = aws_ssm_parameter.database_name.name
}

output "parameter_db_user" {
  value = aws_ssm_parameter.database_user.name
}

output "parameter_db_password" {
  value = aws_ssm_parameter.database_password.name
}
