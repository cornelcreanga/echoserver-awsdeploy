# Echo server deployment project.

The reverse echo project can be found here: https://github.com/cornelcreanga/echoserver . The echoserver-awsdeploy deploys the project into AWS ElasticBeansTalk and implements
a continous integration solution based on CodeBuild/CodePipeline.

The provisioning is done using Terraform.

Prerequisites in order to deploy the solution: Github/AWS account.

Steps

1. Define Terraform variables

| Variable        | Value           |
| ------------- |:-------------:| 
| access_key      | AWS access key | 
| secret_key      | AWS secret key      | 
| github_organization | your github organization (eg www.github.com/myaccount - > myaccount  |
| github_repository | your repository name |
| github_branch | github branch (master or a specific branch |
 
You can use environment variables (https://www.terraform.io/docs/configuration/variables.html) or you can declare a local file
named terraform.tfvars containing the values eg

```
access_key = "*******************"
secret_key = "*******************"
github_organization = "cornelcreanga"
github_repository = "echoserver"
github_branch = "master"
```

2. Invoke init.sh - it will create the S3 bucket used by Terracota.
Note: the bucket name is harcoded as terraform-creanga-artifacts-bucket (also present in terraform.tf), you might have to change it

3. Generate (if you don't already have one) a Github token

4. Invoke GITHUB_TOKEN=Your_Github_Token terraform apply

5. To destroy the infrastructure invoke destroy.sh

Note: For the moment the following s3 buckets cannot be automatically removed
   * terraform-creanga-artifacts-bucket (terraform state)
   * echoserver-artifacts (deployed artefacts)
   
Limitations:

If you want to deploy from multiple branches you will have to specify the branch in codepipeline.tf and a new environment in beanstalk.tf 
