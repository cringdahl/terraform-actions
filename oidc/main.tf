module oidc {
  source = "github.com/rackerlabs/oidc-aws-github-module"
  allowed_repos  = ["repo:RSS-Engineering/undercloud:*", "repo:cringdahl/terraform-actions:*"]
}
output "oidc_arn" {
  value       = module.oidc.role_arn
  description = "Role ARN for use with AWS Credentials Action"
}

# terraform {
#   required_providers {
#     aws = ">= 5.25.0"
#   }
# }

# resource "aws_iam_policy" "s3" {
#   description = "Minimal required permissions to use Terraform state files"
#   name        = "s3TerraformState"
#   policy = jsonencode(
#     {
#       Statement = [
#         {
#           Action = [
#             "s3:PutObject",
#             "s3:GetObject",
#             "s3:ListBucket",
#             "s3:DeleteObject",
#             "iam:GetRole",
#             "iam:GetPolicy",
#             "iam:GetOpenIDConnectProvider",
#             "iam:GetPolicyVersion",
#             "iam:ListRolePolicies",
#             "iam:ListAttachedRolePolicies"
#           ]
#           Effect   = "Allow"
#           Resource = "*"
#           Sid      = "VisualEditor0"
#         },
#       ]
#       Version = "2012-10-17"
#     }
#   )
# }

# resource "aws_iam_policy" "oidc" {
#   description = "Minimal required permissions for OIDC policy"
#   name        = "OIDCPolicy"
#   policy = jsonencode(
#     {
#       Statement = [
#         {
#           Action = [
#             "iam:GetRole",
#             "iam:GetPolicy",
#             "iam:GetOpenIDConnectProvider",
#             "iam:GetPolicyVersion",
#             "iam:ListRolePolicies",
#             "iam:ListAttachedRolePolicies"
#           ]
#           Effect   = "Allow"
#           Resource = "*"
#           Sid      = "VisualEditor0"
#         },
#       ]
#       Version = "2012-10-17"
#     }
#   )
# }

# resource "aws_iam_openid_connect_provider" "default" {
#   client_id_list  = ["sts.amazonaws.com"]
#   url             = "https://token.actions.githubusercontent.com"
#   thumbprint_list = ["1b511abead59c6ce207077c0bf0e0043b1382612"] # github specific
# }

# data "aws_iam_policy_document" "oidc" {
#   statement {
#     effect  = "Allow"
#     actions = ["sts:AssumeRoleWithWebIdentity"]

#     condition {
#       test     = "StringEquals"
#       variable = "token.actions.githubusercontent.com:aud"
#       values   = ["sts.amazonaws.com"]
#     }
#     condition {
#       test     = "StringLike"
#       variable = "token.actions.githubusercontent.com:sub"
#       values   = ["repo:RSS-Engineering/undercloud:*", "repo:cringdahl/terraform-actions:*"]
#     }

#     principals {
#       type        = "Federated"
#       identifiers = [aws_iam_openid_connect_provider.default.arn]
#     }
#   }
# }

# resource "aws_iam_role" "oidc" {
#   name                 = "githubActionsAccessS3TerraformState"
#   assume_role_policy   = data.aws_iam_policy_document.oidc.json
#   description          = "For use with OIDC Github integration"
#   max_session_duration = 3600
# }

# resource "aws_iam_role_policy_attachment" "oidc-policy-attach" {
#   role       = aws_iam_role.oidc.name
#   policy_arn = aws_iam_policy.oidc.arn
# }

# resource "aws_iam_role_policy_attachment" "s3-policy-attach" {
#   role       = aws_iam_role.oidc.name
#   policy_arn = aws_iam_policy.s3.arn
# }

# output "oidc_arn" {
#   value       = aws_iam_role.oidc.arn
#   description = "Role ARN for use with AWS Credentials Action"
# }
