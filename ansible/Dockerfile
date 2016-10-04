# https://www.ansible.com/
#
# docker run \
#   --rm \
# 	-it \
#   -v ${HOME}:${HOME} \
# 	-v ${HOME}/.ssh:/root/.ssh:ro \
#   -w ${PWD} \
# 	rchrd/ansible \
#   ansible --version
#
FROM alpine:latest

RUN builddeps=' \
			python-dev \
			musl-dev \
			openssl-dev \
			libffi-dev \
			gcc \
			' \
		&& apk --no-cache add \
			git \
			ca-certificates \
			py-pip \
			python \
			py-httplib2 \
			${builddeps} \
		&& pip install --upgrade pip \
		&& pip install --upgrade \
			ansible \
			six \
			boto \
		&& apk del --purge ${builddeps}

RUN mkdir -p /etc/ansible/inventories \
		&& apk --no-cache add curl

RUN curl \
			 --location \
			 --silent \
			 https://github.com/adammck/terraform-inventory/releases/download/v0.7-pre/terraform-inventory_v0.7-pre_linux_amd64.zip \
			 -o terraform-inventory.zip \
		&& unzip terraform-inventory.zip \
		&& rm -f terraform-inventory.zip \
		&& mv terraform-inventory /etc/ansible/inventories/

RUN curl \
			--location \
			--silent \
			https://raw.githubusercontent.com/CiscoCloud/terraform.py/master/terraform.py \
			-o /etc/ansible/inventories/terraform.py \
		&& chmod +x /etc/ansible/inventories/terraform.py

COPY ansible.cfg /etc/ansible/ansible.cfg
