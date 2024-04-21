# S3 Static Website Hosted with Terraform
This project focuses on hosting a static website on Amazon S3, with content delivery via AWS CloudFront. The infrastructure setup is managed with Terraform, ensuring modularity, and it includes Terrascan for security checks and compliance.

***Tech Stack and AWS Services used :***
- Terraform for IaC
- AWS S3
- CloudFront
- Terrascan

***Project Overview***
The following components are covered in this project:

- ***Terraform Modules:*** Separate modules for S3 and CloudFront are created to ensure reusability and modularity.
- ***Remote Backend:*** Terraform state is stored in an S3 bucket with state locking enabled through DynamoDB to avoid concurrent state updates.
- ***Terraform State Locking:*** State locking with DynamoDB ensures the integrity of the Terraform state file.
- ***Referencing Variables across Modules:*** Demonstrates how to reference variables from one module to another in the root Terraform file.
- ***Terrascan:*** Implemented Terrascan to perform static analysis of Terraform code to detect security and compliance issues.

****Setup and Deployment****
To deploy the project, follow these steps:

***Terraform Setup:*** Ensure you have Terraform installed. Configure your AWS CLI with the necessary credentials and region.
***Configure Backend:*** Update *backend.tf* to point to your S3 bucket and DynamoDB table for remote backend and state locking.
***Initialize Terraform:*** Navigate to the **'root'** directory and run below command to initialize Terraform with the remote backend.
```
terraform init
```
***Plan Deployment:*** Use below command to preview the changes that will be applied.
```
terraform plan
```
***Apply Deployment:*** Run below command to deploy the infrastructure.
```
terraform apply
```

![image](https://github.com/jaykhamankar2001/terraform-s3-static-stite/assets/74448020/c17709c6-cfaf-4d1b-bfa7-971c7354aa72)

To open website copy the cloudfront_distribution_domain_name value from output section and shown in above image and paste it into your browser

![image](https://github.com/jaykhamankar2001/terraform-s3-static-stite/assets/74448020/a7f311a4-ec97-4393-bc0e-28cafa184cbd)

This image shows our Terraform state file stored in an Amazon S3 bucket

![image](https://github.com/jaykhamankar2001/terraform-s3-static-stite/assets/74448020/e0af1075-9dc1-481a-89c9-7ddae1088690)

Steps for installing Terrascan in VScode powershell:

You can download you desried binary file from here : https://github.com/tenable/terrascan/releases
If you're using Visual Studio Code's terminal on a Windows machine, you should download the Windows version of the binary
```
Invoke-WebRequest -Uri "https://github.com/tenable/terrascan/releases/download/v1.19.1/terrascan_1.19.1_Windows_x86_64.zip" -OutFile "$env:USERPROFILE\Downloads\terrascan.zip"

```
Extract the Binary
```
Expand-Archive -Path "$env:USERPROFILE\Downloads\terrascan.zip" -DestinationPath "$env:USERPROFILE\Downloads\terrascan"

```

Add Terrascan to PATH:

```
$env:Path += ";$env:USERPROFILE\Downloads\terrascan"

```
Verify Installation:

```
terrascan version
```


***Scan with Terrascan:*** After deployment, run below command to ensure your Terraform code complies with security and compliance best practices.

```
terrascan scan
```
***Result of Terrascan:***

![image](https://github.com/jaykhamankar2001/terraform-s3-static-stite/assets/74448020/b9ee5a77-d2e6-4b4f-a6b3-3ae7da43bdb9)
