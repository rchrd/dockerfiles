FROM python:3.9-alpine

RUN apk add --no-cache --virtual builddeps \
			python3-dev \
			musl-dev \
			openssl-dev \
			libffi-dev \
			gcc \
			linux-headers \
			make \
			rust \
			cargo \
		&& apk add --no-cache \
			ca-certificates \
			curl \
			git \
			jq \
			openssh \
			sshpass \
			tzdata \
		&& pip install --upgrade pip \
		&& pip install --upgrade ansible openshift \
		&& apk del builddeps

COPY ansible.cfg /etc/ansible/ansible.cfg
COPY ssh_config /root/.ssh/config

RUN chmod 0600 /root/.ssh/config

RUN ansible-galaxy collection install community.kubernetes
