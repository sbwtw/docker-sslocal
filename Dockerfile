FROM alpine:latest
LABEL Maintainer="sbw <sbw@sbw.so>" \
      Description="Shadowsocks client with v2ray plugin"

# change mirror
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories

RUN apk --update add \
        libsodium \
    && rm -rf /var/cache/apk/*

ADD shadowsocks-v1.8.8-stable.x86_64-unknown-linux-musl.tar.xz /usr/bin
ADD v2ray-plugin-linux-amd64-v1.3.0.tar.gz /usr/bin

CMD ["sslocal", "-U", "-c", "/shadowsocks.json"]
