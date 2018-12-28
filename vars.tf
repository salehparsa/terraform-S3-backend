variable "bucket_name" {
  description = "The name of the S3 bucket. Must be globally unique."
  default     = "aws-backend-state-bucket-salehparsa"
}

variable "aws_region" {
  description = "The AWS region to use"
  default     = "eu-central-1"
}
