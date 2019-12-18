# local-backend-tf
This repo contains code that uses local backend

# What this repo is for
This repo is intended to show how a local backend is created when using terraform

# Why use this repo

Use this repo to create a local backend on your own.

# How to use this repo

 * Install Terraform
 ```
 https://www.terraform.io/downloads.html
 ```
 
 * Clone this repository
 
 ```
 git clone https://github.com/yordanivh/local-backend-tf
 ```
 
 * Change directory
 
 ```
 cd local-backend-tf
 ```
 
 * Initialize the project ( Terraform will download provider plugins)
 
 ```
 terraform init
 ```
 
 * Plan the operation so that you see what actions will be taken
 
```
terraform plan
```
 * Run Terraform apply to create the resources
 
```
terraform apply
```
* By running apply you will get the terraform.tfstate file which will show the current state of your resources.
```
-rw-r--r--   1 yhalachev  staff   512 Dec 18 13:29 terraform.tfstate
```
* To destroy the created resources. Always run this after testing this code to avoid being charged.

```
terraform destroy
```

# Sample output

1. Run init to download necessary plugins
```
local-backend-tf (newbranch) $ terraform init

Initializing the backend...

Initializing provider plugins...
- Checking for available provider plugins...
- Downloading plugin for provider "null" (hashicorp/null) 2.1.2...

The following providers do not have any version constraints in configuration,
so the latest version was installed.

To prevent automatic upgrades to new major versions that may contain breaking
changes, it is recommended to add version = "..." constraints to the
corresponding provider blocks in configuration, with the constraint strings
suggested below.

* provider.null: version = "~> 2.1"

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```
2.Run plan to get a plan of action
```
local-backend-tf (newbranch) $ terraform plan
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.


------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # null_resource.helloWorld will be created
  + resource "null_resource" "helloWorld" {
      + id = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.

------------------------------------------------------------------------

Note: You didn't specify an "-out" parameter to save this plan, so Terraform
can't guarantee that exactly these actions will be performed if
"terraform apply" is subsequently run.
```
3.Run apply to execute that plan
```
local-backend-tf (newbranch) $ terraform apply

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # null_resource.helloWorld will be created
  + resource "null_resource" "helloWorld" {
      + id = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

null_resource.helloWorld: Creating...
null_resource.helloWorld: Provisioning with 'local-exec'...
null_resource.helloWorld (local-exec): Executing: ["/bin/sh" "-c" "echo hello world"]
null_resource.helloWorld (local-exec): hello world
null_resource.helloWorld: Creation complete after 0s [id=8728451638555620418]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
```
4. Run destroy after done
```
local-backend-tf (newbranch) $ terraform destroy
null_resource.helloWorld: Refreshing state... [id=8728451638555620418]

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # null_resource.helloWorld will be destroyed
  - resource "null_resource" "helloWorld" {
      - id = "8728451638555620418" -> null
    }

Plan: 0 to add, 0 to change, 1 to destroy.

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

null_resource.helloWorld: Destroying... [id=8728451638555620418]
null_resource.helloWorld: Destruction complete after 0s

Destroy complete! Resources: 1 destroyed.
```
