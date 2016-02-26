FROM cleardevice/docker-alpine-init

MAINTAINER cd <cleardevice@gmail.com>

ENV CONSUL_TEMPLATE_VERSION=0.13.0

# Install S6 Overlay, Consul Template and Fileconsul
RUN curl -Ls https://releases.hashicorp.com/consul-template/{CONSUL_TEMPLATE_VERSION}/consul_template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip -o consul-template.zip && unzip consul-template.zip -d /usr/local/bin && \
    rm -f consul-template*
