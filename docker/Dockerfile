FROM alpine:latest
MAINTAINER Peter Sellars <psellars@gmail.com>

ENV REFRESHED_AT 2016-10-23
ENV VAULT_VERSION 0.6.2

# x509 expects certs to be in this file only.
RUN apk update && apk add openssl ca-certificates && rm -rf /var/cache/apk/*

# Unzip a verified version of vault and set permissions
COPY vault /bin/vault

EXPOSE 8200
VOLUME "/config"

ENTRYPOINT ["/bin/vault"]
CMD ["server", "-dev-listen-address=0.0.0.0:8200", "-dev"]
