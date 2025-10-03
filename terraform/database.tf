resource "aws_db_subnet_group" "subnet_group" {
  name = "${var.project}-${var.environment}-subnets"
  subnet_ids = var.db_subnets
}

resource "aws_db_instance" "database" {
  allocated_storage           = var.db_min_storage
  allow_major_version_upgrade = true
  apply_immediately           = true
  auto_minor_version_upgrade  = true
  availability_zone           = "${var.aws_region}a"
  db_subnet_group_name        = aws_db_subnet_group.subnet_group.name
  delete_automated_backups    = true
  engine                      = "postgres"
  instance_class              = var.db_instance_size
  license_model               = "postgresql-license"
  username                    = var.db_user_name
  password                    = var.db_password
  port                        = var.db_port
  skip_final_snapshot         = var.db_skip_snapshot
  storage_encrypted           = true
  vpc_security_group_ids      = [ aws_security_group.db_sg.id ]
  snapshot_identifier         = var.db_source_snapshot
}
