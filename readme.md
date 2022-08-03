# EC2 Terraform

## Initialize with backend configs
```
terraform init \
    -backend-config="bucket=BUCKET_NAME" \
    -backend-config="region=AWS_REGION" \
    -backend-config="key=TF_STATE_KEY" \
    -backend-config="dynamodb_table=DYNAMODB_TABLE" \
    -backend-config="encrypt=true"
```

## Create a tfvars file
```
deployer_role  = ""
environment    = ""
instance_count = 1
instance_type  = "t2.micro"
isDemo         = true
key_name       = ""
owner          = ""
region         = ""
server_name    = ""
```

## Create terraform plan
```
terraform plan -var-file vars.tfvars -out plan
```

## Apply plan
```
terraform apply plan
```

## Using the makefile
Using the makefile will require to create 4 environment variables below.
These 4 environment variables will be used in `terraform init` for the backend configs.
- BUCKET
- REGION
- KEY
- LOCK_DB

Initializing
```
make tfinit
```

Deploying
```
make tfdeploy
```

Destroying
```
make tfdestroy
```