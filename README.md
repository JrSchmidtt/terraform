# This is a guide on how to install Terraform cli on Windows and Ubuntu.

Terraform is an open-source infrastructure as code software tool created by HashiCorp. It enables users to define and provision a datacenter infrastructure using a high-level configuration language known as Hashicorp Configuration Language, or optionally JSON.

And on this project we will be using Terraform to provision our infrastructure on Azure or AWS.

## Install Terraform cli on Windows

### Step 1

Download the Terraform cli from [here](https://www.terraform.io/downloads.html)

### Step 2

Extract the zip file

### Step 3

Add the path to the environment variable

### Step 4

Open the command prompt and type `terraform -help`

## Install Terraform cli on Ubuntu

### Step 1

```bash
sudo apt-get update
```

### Step 2

```bash
sudo apt-get install -y gnupg software-properties-common curl
```

### Step 3

```bash
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
```

### Step 4

```bash
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
```

### Step 5

```bash
sudo apt-get update && sudo apt-get install terraform
```

### Step 6

```bash
terraform -help
```

## Terraform commands


Initialize the terraform project.
```bash
terraform init
```

Show the current state of the terraform project.
```bash
terraform show
```

Validate the syntax of the terraform files.
```bash	
terraform validate
```

Create an execution plan for the terraform files and save it to a file.
```bash
terraform plan
```

Apply the terraform files to the cloud provider.
```bash
terraform apply
```

Destroy the resources created by terraform be careful with this command.
```bash
terraform destroy
```