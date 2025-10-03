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
