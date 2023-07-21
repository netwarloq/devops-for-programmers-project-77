### Hexlet tests and linter status:
[![Actions Status](https://github.com/netwarloq/devops-for-programmers-project-77/workflows/hexlet-check/badge.svg)](https://github.com/netwarloq/devops-for-programmers-project-77/actions)

## Description
[Click to app example](https://project77.netwarlock.ru)


## Requirments
* Ansible
* make
* Terraform (for start infra on DigitalOcean)

## Instruction

### Create Infra
* Login in your Terraform account

``` bash
terraform login
```

* Write secrets (example):
``` bash
$ cat secrets.auto.tfvars
do_token = "your Digital Ocean Token"
ssh_key_name = "ssh public key in DO"
regiondc                  = "region dc"
countdroplets             = "2" # counts web droplets
namepj                    = "your project name"
domain_project = "your domain name"

cred_terr_app = "your_api_key_terraform"

dd_api_key    = "your DataDog api key"
dd_app_key = "your DataDog APP key"
```

* then init:
``` bash
make init
```

* Create and check plan:
``` bash
make infra_plan
```

* Apply for Create infra and generate inventory file and vault:
``` bash
make infra_up
```

* For Destroy infra use:
``` bash
make infra_del
```

### Deploy app
* Encrypt sensitive files:
``` bash
make encrypt
```

* Setup (install requirements)
``` bash
make setup
```

* Deploy
``` bash
make deploy
```

* For encrypt sensitive files use:
``` bash
make decrypt
```

<details>
<summary>Manual Deploy App</summary>
<br>

* First need to create a file groups_vars/webservers/vault.yml (Terraform generated vault)

```bash 
cd groups_vars/webservers/
cat vault.yml
db_host: <your_database_host> 
db_name: <your_database_name> 
db_user: <your_database_user> 
db_pass: <your_database_password> 
db_port: <your_database_port> 
dd_api_key: <your DataDog api key>
```

* Then encrypt Vault file for security:
```bash
ansible-encript vault.yml
```

* Specify your servers in inventory.ini
``` bash
cat inventory.ini
[webservers]
web[1:2].your_domain

[webservers:vars]
ansible_user=root
```

* Setup (install requirements)
``` bash
make setup
```

* Deploy
``` bash
make deploy
```

#### Manual check ansible:
``` bash
ansible-playbook -i inventory.ini playbook.yml -t <deploy/datadog/untagged> --ask-vault-pass --check
```
untagged use for setup (install pip/docker)
</details>

### Links:
- [Official Ansible documentation](https://docs.ansible.com/)
- [Datadog](https://www.datadoghq.com/)