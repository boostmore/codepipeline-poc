variable "pipeline_name" {
  description = "Pipeline Name"
  type = string
  default = "dw-poc-tf-pipeline"
}

variable "s3_bucket_codepipeline" {
  description = "S3 Bucket to store codepipeline artifacts"
  type = string
  default = "codepipeline-us-west-2-836563167445"
}

variable "git_repository_id" {
  description = "github repository. Should be owner/repo_name"
  type = string
  default = "boostmore/codepipeline-poc"
}

variable "git_source_name" {
  description = "source name must not be greater than 32 characters"
  type = string
  default = "dw-source-poc-tf"
}