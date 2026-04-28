############################
# GitHub OIDC Provider
############################
resource "aws_iam_openid_connect_provider" "github" {
  url = "https://token.actions.githubusercontent.com"

  client_id_list = [
    "sts.amazonaws.com"
  ]

  thumbprint_list = [
    "6938fd4d98bab03faadb97b34396831e3780aea1"
  ]
}

############################
# IAM Role for GitHub Actions
############################
resource "aws_iam_role" "github_actions_role" {
  name = "github-actions-ecr-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Federated = aws_iam_openid_connect_provider.github.arn
        }
        Action = "sts:AssumeRoleWithWebIdentity"
        Condition = {
          StringEquals = {
            "token.actions.githubusercontent.com:aud" = "sts.amazonaws.com"
          }
          StringLike = {
            "token.actions.githubusercontent.com:sub" = "repo:BIONICLE0/cicd-demo:*"
          }
        }
      }
    ]
  })
}

############################
# IAM Policy（ECR push用）
############################
resource "aws_iam_role_policy_attachment" "ecr" {
  role       = aws_iam_role.github_actions_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
}

############################
# ECR
############################
resource "aws_ecr_repository" "backend" {
  name = "cicd-demo-backend"

  image_scanning_configuration {
    scan_on_push = true
  }
}

############################
# Output
############################
output "ecr_url" {
  value = aws_ecr_repository.backend.repository_url
}

output "github_role_arn" {
  value = aws_iam_role.github_actions_role.arn
}