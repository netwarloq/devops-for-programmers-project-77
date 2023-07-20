init:
	terraform -chdir=terraform init

infra_plan:
	terraform -chdir=terraform plan

infra_up:
	terraform -chdir=terraform apply
	terraform -chdir=terraform output -raw vault > ansible/group_vars/webservers/vault.yml
	terraform -chdir=terraform output -raw inventory > ansible/inventory.ini

infra_del:
	terraform -chdir=terraform destroy

setup:
	ansible-galaxy install -r ansible/requirements.yml 
	ansible-playbook -i ansible/inventory.ini ansible/playbook.yml -t untagged --ask-vault-pass

deploy:
	ansible-playbook -i ansible/inventory.ini ansible/playbook.yml -t deploy --ask-vault-pass

encrypt:
	ansible-vault encrypt ansible/group_vars/webservers/vault.yml terraform/secrets.auto.tfvars

decrypt:
	ansible-vault decrypt ansible/group_vars/webservers/vault.yml terraform/secrets.auto.tfvars