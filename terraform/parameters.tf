resource "aws_ssm_parameter" "database_host" {
  name = "/${var.project}/${var.version_id}/${var.environment}/dbhost"
  type = "String"
  value = aws_db_instance.database.address
}

resource "aws_ssm_parameter" "database_user" {
  name = "/${var.project}/${var.version_id}/${var.environment}/dbuser"
  type = "String"
  value = var.db_user_name
}

resource "aws_ssm_parameter" "database_password" {
  name = "/${var.project}/${var.version_id}/${var.environment}/dbpasswd"
  type = "SecureString"
  value = var.db_password
}

resource "aws_ssm_parameter" "database_name" {
  name = "/${var.project}/${var.version_id}/${var.environment}/dbname"
  type = "String"
  value = "${var.project}${var.version_id}"
}

resource "aws_vpc_endpoint" "ssm_endpoint" {
  vpc_id            = var.vpc_id
  service_name      = "com.amazonaws.${var.aws_region}.ssm"
  subnet_ids        = var.app_subnets
  vpc_endpoint_type = "Interface"
  security_group_ids = [ aws_security_group.vpc_https_sg.id ]
  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "ssm_messages_endpoint" {
  vpc_id            = var.vpc_id
  service_name      = "com.amazonaws.${var.aws_region}.ssmmessages"
  subnet_ids        = var.app_subnets
  vpc_endpoint_type = "Interface"
  security_group_ids = [ aws_security_group.vpc_https_sg.id ]
  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "ec2_messages_endpoint" {
  vpc_id            = var.vpc_id
  service_name      = "com.amazonaws.${var.aws_region}.ec2messages"
  subnet_ids        = var.app_subnets
  vpc_endpoint_type = "Interface"
  security_group_ids = [ aws_security_group.vpc_https_sg.id ]
  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "secrets_manager_endpoint" {
  vpc_id            = var.vpc_id
  service_name      = "com.amazonaws.${var.aws_region}.secretsmanager"
  subnet_ids        = var.app_subnets
  vpc_endpoint_type = "Interface"
  security_group_ids = [ aws_security_group.vpc_https_sg.id ]
  private_dns_enabled = true
}
