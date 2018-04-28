all: init plan

init:
	rm -rf .terraform/modules
	terraform init

plan: init
	terraform plan

apply: init
	terraform apply

destroy: init
	terraform destroy

lint:
	terraform fmt -list=true -write=true

.PHONY: all init plan apply destroy lint
