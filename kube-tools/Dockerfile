FROM alpine:3.10

ENV KUBEVAL_VERSION=0.14.0 \
    KUBECTL_VERSION=1.15.4 \
    KUSTOMIZE_VERSION=3.2.0

RUN apk add --no-cache curl make

RUN curl -L https://github.com/instrumenta/kubeval/releases/download/${KUBEVAL_VERSION}/kubeval-linux-amd64.tar.gz -o /tmp/kubeval-linux-amd64.tar.gz \
    && tar xf /tmp/kubeval-linux-amd64.tar.gz -C /tmp \
    && mv /tmp/kubeval /usr/local/bin \
    && rm -rf /tmp/kubeval-linux-amd64.tar.gz

RUN curl -L https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl

RUN curl -L https://github.com/kubernetes-sigs/kustomize/releases/download/v${KUSTOMIZE_VERSION}/kustomize_${KUSTOMIZE_VERSION}_linux_amd64 -o /usr/local/bin/kustomize \
    && chmod +x /usr/local/bin/kustomize
