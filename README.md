# Echo server deployment project.

The solution is based on AWS ElasticBeansTalk/CodeBuild/CodePipeline. The provisioning is done using Terraform.

Prerequisites in order to deploy the solution: Github/AWS account.

Terraform variables:

| access_key | AWS access key |

| Variable        | Value           |
| ------------- |:-------------:| 
| access_key      | AWS access key | 
| secret_key      | AWS secret key      | 
| github_organization | your github organization (eg www.github.com/myaccount - > myaccount  |
| github_repository | www.github.com/myaccount/myrepo - > myrepo |
| github_branch | github branch. |
 
You can use environment variables (https://www.terraform.io/docs/configuration/variables.html) or you can declare a local file
named terraform.tfvars containing the values eg

```
access_key = "*******************"
secret_key = "*******************"
github_organization = "cornelcreanga"
github_repository = "echoserver"
github_branch = "master"
```

To init terraform invoke init.sh
To apply the modifications invoke GITHUB_TOKEN=<your github token> terraform apply
To destroy the infrastructure invoke destroy.sh

Note: there are two s3 buckets that are hardcoded right now:
   * terraform-creanga-artifacts-bucket (terraform state)
   * echoserver-artifacts (deployed artefacts)
   
The buckets can't be automatically destroyed for the moment.

Limitations:

If you want to deploy from multiple branches you will have to specify the branch in codepipeline.tf and the environment in beanstalk.tf 
