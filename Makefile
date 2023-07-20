init:
	terraform -chdir=terraform init

infra_plan:
	terraform -chdir=terraform plan

infra_up:
	terraform -chdir=terraform apply

infra_del:
	terraform -chdir=terraform destroy

setup:
	ansible-galaxy install -r ansible/requirements.yml 
	ansible-playbook -i ansible/inventory.ini ansible/playbook.yml -t untagged --ask-vault-pass

deploy:
	ansible-playbook -i ansible/inventory.ini ansible/playbook.yml -t deploy --ask-vault-pass