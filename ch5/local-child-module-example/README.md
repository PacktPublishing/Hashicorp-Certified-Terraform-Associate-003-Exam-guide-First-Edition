This folder contains example code to show how the local module works. 

The focus here is to show the working of the local module and the steps followed to launch 
the ec2 instance is only for testing and does not follow all best practices required for production. 
For example, there is no keypair associated to the instance to avoid security concerns with this module.

This folder contains following files and folders:
modules     - This folder has the child modules "networking", "security-group" and "ec2" which get called from the root module to create the resources. 
provider.tf - This has the code about the provider used(AWS), its version(5.34.0) and the AWS region(ap-south-1).
outputs.tf  - This has the code to get the output details of the resources that get created. 
main.tf     - This is the main file where the child modules are getting called and the resources are getting created. 

Usage:
Make sure you have cloned the repository. If not, run the following command:
git clone https://github.com/PacktPublishing/Hashicorp-Certified-Terraform-Associate-003-Exam-guide-Second-Edition.git

Navigate to the folder that has code related to the local module:
cd Hashicorp-Certified-Terraform-Associate-003-Exam-guide-Second-Edition/ch5/local-child-module-example/

Initialize Terraform:
terraform init

Run the Terraform plan:
terraform plan

Run Terraform apply with no prompt:
terraform apply -auto-approve

Once you are done with the exercise, make sure to delete the resource to avoid charges. As EC2 instance is created in this exercise, you will incur charges if you do not delete it. 
Make sure you are in the right folder before running the below command as it will delete all the resources without asking for any confirmation. 
terraform destroy -auto-approve 

In this example, you will create below resources:
A VPC with the CIDR block 10.51.0.0/16 and a subnet with CIDR block 10.51.1.0/24 is created using the local module "networking" present under the modules folder.
A security group is created using the local module "security-group" present under the module folder. There is only one IP allowed 1.2.3.4/32 to show how to whitelist the IP. This will have to be changed to any IP you may desire to whitelist. 
Using the datasource, you get the latest Amazon Linux 2 AMI ID. 
Launch an EC2 instance at the end which uses the local module "ec2" present under the modules folder.

Input:
No input needs to be provided as this is just an example of the local module to help you understand the concepts. There are no variables that need external inputs. 

Output:
vpc_id - This gives the VPC ID that got created. 
sg_id  - This gives the security group id.
ec2_id - This gives the Instance ID of the EC2 instance that is created. 
igw_id - This gives the Internet Gateway's ID. 