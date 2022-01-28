# Create Elastic Beanstalk using Terraform
[Terraform](https://www.terraform.io/) is a popular Infrastructure As Code (IaC) tooling that allows users to create infrastructure in multiple cloud platforms and other environments like Docker, Kubernetes and even custom resources. 

This project is a pet project created by me as a community contribution. It helps the users to create elastic beanstalk environment in few easy steps. The code currently supports creation of: 
* PHP environment 
* Java environment 
* Tomcat environment 
* Go environment 

It is easy to add more support too - just by adding the relevant Solution Stack names in [variables.tf](./variables.tf) file. The solution stack names are available at this [link](https://docs.aws.amazon.com/elasticbeanstalk/latest/platforms/platforms-supported.html)

## Pre-requisites
1. [Install Terraform CLI](https://learn.hashicorp.com/tutorials/terraform/install-cli)
2. [Understand basics of how Terraform works](https://learn.hashicorp.com/collections/terraform/aws-get-started)
3. [Configure AWS CLI credentials](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html)
4. Note the profile name created in the above step. Modify the `profile` attribute in [config.tf](./config.tf) accordingly
5. Modify the variables `eb_app_name` and `eb_env_name` to be unique as AWS requires them to be unique globally.

## Validate the code and plan infrastructure
To validate that you have the require access and the code is in good shape to proceed, run the below commands. 

```hcl 
$ terraform init


Initializing the backend...

Initializing provider plugins...
- Finding hashicorp/aws versions matching "3.73.0"...
- Installing hashicorp/aws v3.73.0...
- Installed hashicorp/aws v3.73.0 (signed by HashiCorp)

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.

```

This command downloads the required provider and saves it in your local disk. Next, run the `terraform plan` to check what is to be created. 

## Creating the Elastic beanstalk environment 
Finally, once everything looks good, use `terraform apply -auto-approve` to apply the Terraform code and create the environment.