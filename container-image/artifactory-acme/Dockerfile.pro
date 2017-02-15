FROM goern-docker-registry.bintray.io/goern/artifactory-pro:5.0.1-1

MAINTAINER Christoph Görn <goern@redhat.com>

COPY ./root /opt/jfrog/artifactory

USER 0

RUN keytool -importcert -keystore /etc/pki/ca-trust/extracted/javacacerts -storepass changeit -file /opt/jfrog/artifactory/sso.crt -alias “sso-root” -noprompt -trustcacerts && \
    keytool -importcert -keystore /etc/pki/ca-trust/extracted/javacacerts -storepass changeit -file /opt/jfrog/artifactory/server.crt -alias “sso-server” -noprompt -trustcacerts

USER 1013

ENV BUILD_VERSION 1
