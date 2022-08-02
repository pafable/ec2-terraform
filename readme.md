# EC2 Terraform

Initialize with backend configs
```
terraform init \
    -backend-config="bucket=BUCKET_NAME" \
    -backend-config="region=AWS_REGION" \
    -backend-config="key=TF_STATE_KEY" \
    -backend-config="dynamodb_table=DYNAMODB_TABLE" \
    -backend-config="encrypt=true"
```

Create a tfvars file
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

Create terraform plan
```
terraform plan -var-file vars.tfvars -out plan
```

Apply plan
```
terraform apply plan
```