resource "aws_codepipeline" "codepipeline" {
    name = var.pipeline_name
    role_arn = aws_iam_role.codepipeline_role.arn

  artifact_store {
    location = var.s3_bucket_codepipeline
    type     = "S3"
  }

  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeStarSourceConnection"
      version          = "1"
      output_artifacts = ["source_output"]

      configuration = {
        ConnectionArn = aws_codestarconnections_connection.git_repo.arn
        FullRepositoryId = var.git_repository_id
        BranchName       = "main"
        OutputArtifactFormat = "CODE_ZIP"
        DetectChanges = true
      }
    }
  }

  stage {
    name = "TerraformPlan"

    action {
      name             = "TerraformPlan"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      version          = "1"
      input_artifacts  = ["source_output"]
      output_artifacts = ["build_output"]

      configuration = {
        ProjectName = "dw-poc-terraform-plan"
      }
    }
  }
}

resource "aws_codestarconnections_connection" "git_repo" {
  name          = var.git_source_name
  provider_type = "GitHub"
}