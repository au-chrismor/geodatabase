resource "aws_lambda_function" "country_count" {
  depends_on            = [ aws_lambda_layer_version.runtime ]
  architectures         = [ "x86_64" ]
  environment {
    variables           = {
      ENVIRONMENT       = var.environment
      PROJECT           = var.project
      VERSION           = var.version_id
    }
  }
  filename              = "${var.api_country_count_name}.zip"
  function_name         = var.api_country_count_name
  handler               = "${var.api_country_count_name}.lambda_handler"
  layers                = [ aws_lambda_layer_version.runtime.arn, var.lambda_extension_arn ]
  role                  = aws_iam_role.country_count_role.arn
  runtime               = "python3.12"
  source_code_hash      = filebase64sha256("${var.api_country_count_name}.zip")
  timeout               = 60
  tracing_config {
    mode                = "Active"
  }
  vpc_config {
    security_group_ids  = [ aws_security_group.vpc_access_sg.id ]
    subnet_ids          = var.app_subnets
  }
}

data "archive_file" "country_count_zip" {
  type                  = "zip"
  output_path = "${var.api_country_count_name}.zip"
  source_dir  = "../lambda/get_country_count"
}
