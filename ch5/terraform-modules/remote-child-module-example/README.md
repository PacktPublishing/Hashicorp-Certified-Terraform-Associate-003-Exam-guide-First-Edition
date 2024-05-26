This is a sample code which shows how the public module can be used to launch VPC, security group and ec2 instance. 

The focus here is to show the working of the remote module and the steps followed to launch 
the ec2 instance is only for testing and does not follow all best practices required for production. 
For example, there is no keypair associated to the instance to avoid security concerns with this module.

This folder contains the following files and folders:
provider.tf - This has the code about the provider used(AWS), its version(5.34.0) and the AWS region(ap-south-1).
outputs.tf  - This has the code to get the output details of the resources that get created. 
main.tf     - This is the main file where the child modules are getting called and the resources are getting created. 

Usage:
Make sure you have cloned the repository. If not, run the following command:
git clone https://github.com/PacktPublishing/Hashicorp-Certified-Terraform-Associate-003-Exam-guide-Second-Edition.git

Navigate to the folder that has code related to the remote module:
cd Hashicorp-Certified-Terraform-Associate-003-Exam-guide-Second-Edition/ch5/remote-child-module-example/

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
A VPC with the CIDR block 10.52.0.0/16 and subnets with CIDR block 10.52.1.0/24, 10.52.2.0/24, 10.52.3.0/24 are created using the remote module present in the Terraform registry.
A security group is created using the remote module present in the Terraform registry. There is only one IP allowed 1.2.3.4/32 to show how to whitelist the IP. This will have to be changed to any IP you may desire to whitelist. 
Using the datasource, you get the latest Amazon Linux 2 AMI ID. 
Launch an EC2 instance at the end which uses the remote module from the Terraform registry. 

Input:
No input needs to be provided for this exercise as all the inputs for the variables are already passed for the public module that is used. 

Output:
vpc_id              - This gives the VPC ID that got created. 
security_group_id   - Security group ID of the SG provisioned by the module
ec2_id              - Instance ID of the EC2 provisioned by the module 
igw_id              - This gives the Internet Gateway's ID. 
public_subnets      - List of IDs of public subnets