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