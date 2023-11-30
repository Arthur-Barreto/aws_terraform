# Terraform State Storage Bucket

## Overview

This repository serves the purpose of creating a dedicated bucket for storing Terraform state files. Terraform relies on state files to keep track of the infrastructure's current state, and having a designated bucket ensures proper version control and secure storage.

## Why a Bucket?

Creating a bucket is essential for the following reasons:

- **Terraform State Storage**: The bucket acts as a centralized location to store Terraform state files.

- **Version Control**: The bucket has version control enabled, allowing us to keep track of changes made to the state file over time.

## How to Create the Bucket?

This is a Terraform project as well, so we need to run the following commands:

```bash
terraform init
terraform validate
terraform plan
terraform apply
```

Now, we are ready to run the real Terraform project !