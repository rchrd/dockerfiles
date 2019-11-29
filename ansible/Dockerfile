FROM python:3.7-alpine

RUN apk add --no-cache --virtual builddeps \
			python3-dev \
			musl-dev \
			openssl-dev \
			libffi-dev \
			gcc \
			linux-headers \
			make \
		&& apk add --no-cache \
			ca-certificates \
			curl \
			git \
			jq \
			openssh \
			sshpass \
		&& pip install --upgrade pip \
		&& pip install --upgrade ansible[azure] ansible-cmdb \
		&& apk del builddeps

COPY ansible.cfg /etc/ansible/ansible.cfg
COPY ssh_config /root/.ssh/config
