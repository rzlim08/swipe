variable "namespace" {
  description = "namespace (will appear in managed asset names)"
  type        = string
  default     = "swipe"
}

variable "s3_bucket_arns" {
  description = "S3 buckets that swipe batch jobs may read/write"
  type        = list(string)
}

variable "batch_job_docker_image_name" {
  description = "Docker image (name or name:tag) that will be used for Batch jobs"
  type        = string
}

variable "use_ecr_private_registry" {
  description = "If true (default), batch_job_docker_image_name is expected to be found in the private registry for the host AWS account. If false, the name is passed verbatim (as a Docker Hub or other registry URL)"
  type        = bool
  default     = true
}

variable "batch_job_timeout_seconds" {
  description = "Timeout after which Batch will terminate jobs (Step Functions has a separate timeout for the SFN execution)"
  type        = number
  default     = 86400
}

variable "batch_job_retry_attempts" {
  description = "Number of times Batch will try to run the job. If using Step Functions, this is best left at 1 and retries configured in the SFN."
  type        = number
  default     = 1
}

variable "tags" {
  description = "Tags to apply to managed assets"
  type        = map(string)
  default     = {}
}

variable "batch_role_arn" {
  description = "ARN of the role assumed by Batch jobs"
  type        = string
}
