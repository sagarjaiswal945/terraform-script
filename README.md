Terraform configuration to create AWS VPC, subnets, security groups, and EC2 instances.

**Overview**
- This repository contains Terraform files to provision a VPC, public and private subnets, an Internet Gateway, route tables, security groups, an SSH key pair (from `gitcred.pub`), and one public and one private EC2 instance.

**Files**
- [provider.tf](provider.tf): AWS provider configuration (region currently set to `ap-south-1`).
- [variable.tf](variable.tf): Terraform variables (VPC CIDR, subnet CIDRs, AZ, AMI, instance type, names).
- [vpc.tf](vpc.tf): VPC, subnets, Internet Gateway, route tables and associations.
- [ec2.tf](ec2.tf): Key pair resource using `gitcred.pub`, security groups, and EC2 instances (public and private).
- [output.tf](output.tf): Outputs for created resource IDs and instance IPs.
- `gitcred.pub`: public SSH key used by the `aws_key_pair` resource (must exist in repo root).

**Prerequisites**
- Install Terraform (1.0+ recommended).
- Configure AWS credentials (environment variables, `~/.aws/credentials`, or AWS CLI).
- Ensure `gitcred.pub` is present in the repository root and contains a valid SSH public key.

**Usage**
1. Initialize Terraform providers:

```bash
terraform init
```

2. Review the planned changes:

```bash
terraform plan -out=tfplan
```

3. Apply the plan:

```bash
terraform apply tfplan
```

4. To destroy the resources when finished:

```bash
terraform destroy -auto-approve
```

**Notes & Customization**
- Region: change the region in [provider.tf](provider.tf) if you need a different AWS region.
- AMI: set a different `ami_id` in [variable.tf](variable.tf) to match the desired OS/region.
- Availability Zone: change `availability_zone` in [variable.tf](variable.tf) if required.
- Key pair: if you prefer to manage the key outside Terraform, remove or modify the `aws_key_pair` resource in `ec2.tf` and set `key_name` to an existing key.
- Security: current security groups allow SSH/HTTP/HTTPS from anywhere — tighten these rules for production.

**Helpful Terraform commands**
- Validate configuration: `terraform validate`
- Format files: `terraform fmt`
- Show outputs: `terraform output`

If you want, I can update `provider.tf` to receive the region from a variable, or add a `terraform.tfvars` example — tell me which you'd like.
