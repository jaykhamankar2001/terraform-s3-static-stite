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
Scan with Terrascan: After deployment, run terrascan scan to ensure your Terraform code complies with security and compliance best practices.
