PACKAGE=new-arch
VERSION=latest
TAG=$(PACKAGE):$(VERSION)
NAME=new-arch

# Convenience functions to kill and remove containers
rm_ctx_id = if docker ps -qa --filter "id=$(1)" | grep -q .; then echo -n "> rm -f "; docker rm -f $(1); fi
rm_ctx_name = if docker ps -qa --filter "name=$(1)" | grep -q .; then echo -n "> rm -f "; docker rm -f $(1); fi

build: build-image

build-image:
	sudo docker build -t $(TAG) .

run: run-container

run-container:
	sudo docker run --name=$(NAME) --detach --privileged --volume=`pwd`:/etc/ansible/roles/role_under_test:ro $(TAG)

shell:
	docker exec -it new-arch env TERM=xterm bash

ansible-install:
	ansible-galaxy install -r requirements.yml && ansible-playbook local.yml --ask-vault-pass

test: test-image

test-image:
	sudo docker exec -i $(NAME) env TERM=xterm ansible-playbook ./local.yml --ask-vault-pass

clean-container:
	$(call rm_ctx_name,new-arch)

clean-image:
	docker rmi $(TAG)

clean: clean-container clean-image
