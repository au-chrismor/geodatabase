resource "aws_iam_role" "country_count_role" {
  name = "${var.project}-${var.environment}-countrycount"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })
}


resource "aws_iam_policy" "parameter_access" {
  name        = "${var.project}-${var.environment}-param-access"
#  path        = "/"
  description = "Access to Parameters From Lambda"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ssm:GetParameter",
          "ssm:GetParameters",
          "ssm:GetParametersByPath",
          "kms:Decrypt"
        ]
        Effect   = "Allow"
        Resource = "arn:aws:ssm:${var.aws_region}:${var.aws_account}:parameter/${var.project}/*"
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "create_user_lambda_execution" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  role       = aws_iam_role.country_count_role.name
}

resource "aws_iam_role_policy_attachment" "create_user_lambda_vpc_execution" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"
  role       = aws_iam_role.country_count_role.name
}

resource "aws_iam_role_policy_attachment" "create_user_parameter_access" {
  policy_arn = aws_iam_policy.parameter_access.arn
  role = aws_iam_role.country_count_role.name
}
