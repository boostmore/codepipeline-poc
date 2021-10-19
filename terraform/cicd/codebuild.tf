resource "aws_codebuild_project" "dw-poc-terraform-plan" {
  name = "dw-poc-terraform-plan"
  service_role = aws_iam_role.codebuild_role.arn

  artifacts {
    type = "CODEPIPELINE"
  }

  environment {
    type = "LINUX_CONTAINER"
    compute_type = "BUILD_GENERAL1_SMALL"
    image = "aws/codebuild/amazonlinux2-x86_64-standard:3.0"
  }

  source {
    type = "CODEPIPELINE"
  }

}