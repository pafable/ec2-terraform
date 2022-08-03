tfinit:
	terraform -chdir=terraform init \
 		-backend-config="bucket=${BUCKET}" \
 		-backend-config="region=${REGION}" \
 		-backend-config="key=${KEY}" \
 		-backend-config="dynamodb_table=${LOCK_DB}" \
 		-backend-config="encrypt=true"

tfdeploy: tfinit
	terraform -chdir=terraform plan \
		-var-file vars.tfvars \
		-out plan
	terraform -chdir=terraform apply plan

tfdestroy:
	terraform -chdir=terraform plan \
		-var-file vars.tfvars \
		-out plan \
		-destroy
	terraform -chdir=terraform apply plan