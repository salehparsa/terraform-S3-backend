# S3 Remote State Backend

This repository helps you to store Terraform State in [S3](https://aws.amazon.com/s3/) bucket in an [Amazon Web Services (AWS)](http://aws.amazon.com/). The S3 bucket can be used for [remote state storage](https://www.terraform.io/docs/backends/types/s3.html).

## Pre-requisites

* You must have [Terraform](https://www.terraform.io/) installed on your computer.
* You must have an [Amazon Web Services (AWS) account](http://aws.amazon.com/).

This templated tested with Terraform v0.11.11 and provider.aws v1.54.0.

## Configure AWS Access Key

Technically, [Terraform](https://www.terraform.io) can read Access Key from `env` file. Thus, you can configure AWS Access Key with [AWS CLI](https://docs.aws.amazon.com/cli/latest/reference/configure/index.html):

```
aws configure
```

Configure your [AWS access
keys](http://docs.aws.amazon.com/general/latest/gr/aws-sec-cred-types.html#access-keys-and-secret-access-keys) as
environment variables:

```
export AWS_ACCESS_KEY_ID=(your access key id)
export AWS_SECRET_ACCESS_KEY=(your secret access key)
```

## Configuration

In `vars.tf` you can define Bucket Name and AWS Region of Your bucket by using the `default` parameter:

```hcl
variable "bucket_name" {
  description = "The name of the S3 bucket. Must be globally unique."
  default = "(YOUR_BUCKET_NAME)"
}
```

```hcl
variable "aws_region" {
  description = "The AWS region to use"
  default = "(AWS Region)"
}
```

## Terraform

Validate the templates:

```
terraform plan
```

Deploy the code:

```
terraform apply
```

In case if you need to clean up when you're done you need to change  `prevent_destroy = false` in `main.tf` first and then perform following:

```
terraform apply
```

```
terraform destroy
```

## Usage as a Backend Configuration

For using this bucket as [remote state storage](https://www.terraform.io/docs/backends/types/s3.html) you need to add following configuration in terraform file:

```hcl
terraform {
  backend "s3" {
    bucket = "${var.db_remote_state_bucket}"
    key    = "(Path To Your tfstate file)/terraform.tfstate"
    region = "(Bucket Region)"
  }
}
```
