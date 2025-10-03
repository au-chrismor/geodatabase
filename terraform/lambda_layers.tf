resource "aws_lambda_layer_version" "runtime" {
  filename   = var.lambda_runtime_file
  layer_name = "${var.project}-${var.environment}-run-time"
  compatible_runtimes = ["python3.12"]
  compatible_architectures = [ "x86_64" ]
  source_code_hash = filebase64sha256(var.lambda_runtime_file)
}

data "archive_file" "runtime_zip" {
  type        = "zip"
  output_path = var.lambda_runtime_file
  source_dir  = "../lambda_layers/runtime/"
}
