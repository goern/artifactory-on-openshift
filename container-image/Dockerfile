FROM openshift/base-centos7

MAINTAINER Christoph Görn <goern@redhat.com>

ENV ARTIFACTORY_VERSION="4.13.2"
ENV ARTIFACTORY_HOME="/var/opt/jfrog/artifactory"

LABEL name="JFrog Artifactory OSS" \
      vendor="JFrog Ltd" \
      license="GPLv3" \
      io.k8s.display-name="JFrog Artifactory OSS" \
      io.k8s.description="The world's most advanced repository manager. Artifactory offers powerful enterprise feature and fine-grained permission control behind a sleek and easy-to-use UI." \
      summary="The world's most advanced repository manager. Artifactory offers powerful enterprise feature and fine-grained permission control behind a sleek and easy-to-use UI." \
      io.openshift.expose-services="8081,artifactory" \
      io.openshift.tags="artifactory" \
      build-date="2016-10-20" \
      version="4.13.2" \
      release="2"

WORKDIR /opt/jfrog/artifactory

# Create user that has known UID
# We need to do this before installing the RPMs which would create user with random UID
RUN getent group  artifactory &> /dev/null || groupadd -r artifactory &> /dev/null && \
    getent passwd artifactory &> /dev/null || useradd -u 1013 -r -g artifactory -d $HOME -s /sbin/nologin   -c 'Artifactory Server' artifactory &> /dev/null

RUN INSTALL_PKGS="net-tools bc java-1.8.0-openjdk java-1.8.0-openjdk-devel postgresql-jdbc" && \
    yum install -y --enablerepo=centosplus $INSTALL_PKGS && \
    rpm -V $INSTALL_PKGS && \
    yum clean all -y

RUN rpm -Uvh https://bintray.com/jfrog/artifactory-rpms/download_file?file_path=jfrog-artifactory-oss-${ARTIFACTORY_VERSION}.rpm

COPY ./root /opt/jfrog/artifactory
COPY run-artifactory.sh /usr/bin/

RUN chmod +x /usr/bin/run-artifactory.sh && \
    mkdir -p /var/opt/jfrog/artifactory/logs/catalina /opt/jfrog/artifactory/logs/ /var/opt/jfrog/artifactory/etc && \
    chown -R 1013:0 /usr/bin/run-artifactory.sh $HOME $ARTIFACTORY_HOME /var/opt/jfrog/artifactory/ /etc/opt/jfrog/ && \
    chmod 777 /var/opt/jfrog/artifactory/logs /var/opt/jfrog/artifactory/logs/catalina /opt/jfrog/artifactory/logs /var/opt/jfrog/artifactory/etc

VOLUME [ "/opt/jfrog/artifactory/tomcat/logs"]

EXPOSE 8081

ENTRYPOINT [ "/usr/bin/run-artifactory.sh" ]

USER 1013

ENV BUILD_VERSION 2
