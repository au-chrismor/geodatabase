output "parameter_db_host" {
  value = aws_ssm_parameter.database_host.name
}

output "parameter_db_name" {
  value = aws_ssm_parameter.database_name.name
}

output "parameter_db_user" {
  value = aws_ssm_parameter.database_user.name
}

output "parameter_db_password" {
  value = aws_ssm_parameter.database_password.name
}

output "security_group_vpc" {
  value = aws_security_group.vpc_access_sg.id
}

output "security_group_rds" {
  value = aws_security_group.db_sg.id
}

output "dabase_address" {
  value = aws_db_instance.database.address
}

output "lambda_runtime_arn" {
  value = aws_lambda_layer_version.runtime.arn
}

output "lambda_country_count_arn" {
  value = aws_lambda_function.country_count.arn
}
