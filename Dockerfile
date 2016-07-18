FROM cleardevice/docker-alpine-s6-consul-template

MAINTAINER cd <cleardevice@gmail.com>

# Nginx version
ENV NGINX_VERSION=1.9.9 NGINX_HOME=/usr/share/nginx

RUN apk-install openssl-dev pcre-dev zlib-dev wget build-base nano && \
    curl -Ls http://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz | tar -xz -C /tmp && \
    cd /tmp/nginx-${NGINX_VERSION} && \
    ./configure \
        --with-ipv6 \
        --with-http_ssl_module \
        --with-http_gzip_static_module \
        --with-http_v2_module \
        --with-http_realip_module \
        --prefix=${NGINX_HOME} \
        --conf-path=/etc/nginx/nginx.conf \
        --http-log-path=/var/log/nginx/access.log \
        --error-log-path=/var/log/nginx/error.log \
        --pid-path=/var/run/nginx.pid \
        --sbin-path=/usr/sbin/nginx && \
    make && \
    make install && \
    apk del build-base && mkdir -p /etc/nginx/conf.d && \
    rm -rf /tmp/*

# Forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80 443
