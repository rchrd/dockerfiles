FROM alpine:latest

RUN builddeps=' \
			python-dev \
			musl-dev \
			openssl-dev \
			libffi-dev \
			gcc \
			linux-headers \
			make \
			' \
		&& apk --no-cache add \
			${builddeps} \
			ca-certificates \
			curl \
			git \
			jq \
			libssl1.0 \
			openssh \
			py-httplib2 \
			py-pip \
			python \
			sshpass \
		&& pip install --upgrade pip \
		&& pip install --upgrade \
			ansible \
			cryptography \
			boto \
			os-client-config \
			shade \
			six \
			packaging \
			msrestazure \
			azure==2.0.0rc5 \
		&& apk del --purge ${builddeps}

COPY ansible.cfg /etc/ansible/ansible.cfg
COPY ssh_config /root/.ssh/config
