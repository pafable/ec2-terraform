TF = $(shell terraform)
TF_DIR = "terraform"

tfinit:
	${TF} -chdir=${TF_DIR} init \
 		-backend-config="bucket=${BUCKET}" \
 		-backend-config="region=${REGION}" \
 		-backend-config="key=${KEY}" \
 		-backend-config="dynamodb_table=${LOCK_DB}" \
 		-backend-config="encrypt=true"

tfdeploy: tfinit
	${TF} -chdir=${TF_DIR} plan \
		-var-file vars.tfvars \
		-out plan
	${TF} -chdir=${TF_DIR} apply plan

tfdestroy:
	${TF} -chdir=${TF_DIR} plan \
		-var-file vars.tfvars \
		-out plan \
		-destroy
	${TF} -chdir=${TF_DIR} apply plan
