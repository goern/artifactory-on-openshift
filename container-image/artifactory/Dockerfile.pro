FROM openshift/base-centos7

MAINTAINER Christoph Görn <goern@redhat.com>

ENV ARTIFACTORY_VERSION="5.2.1"
ENV ARTIFACTORY_HOME="/var/opt/jfrog/artifactory"

# the license lable makes a statement about this Dockerfile not the packages software
LABEL name="JFrog Artifactory Pro" \
      vendor="JFrog Ltd" \
      license="GPLv3" \
      io.k8s.display-name="JFrog Artifactory Pro" \
      io.k8s.description="The world's most advanced repository manager. Artifactory offers powerful enterprise feature and fine-grained permission control behind a sleek and easy-to-use UI." \
      summary="The world's most advanced repository manager. Artifactory offers powerful enterprise feature and fine-grained permission control behind a sleek and easy-to-use UI." \
      io.openshift.expose-services="8081,artifactory" \
      io.openshift.tags="artifactory" \
      version="5.2.1"

WORKDIR /opt/jfrog/artifactory

# Create user that has known UID
# We need to do this before installing the RPMs which would create user with random UID
RUN getent group  artifactory &> /dev/null || groupadd -r artifactory &> /dev/null && \
    getent passwd artifactory &> /dev/null || useradd -u 1013 -r -g artifactory -d $HOME -s /sbin/nologin   -c 'Artifactory Server' artifactory &> /dev/null

RUN INSTALL_PKGS="wget net-tools bc java-1.8.0-openjdk java-1.8.0-openjdk-devel postgresql-jdbc" && \
    yum install -y --enablerepo=centosplus $INSTALL_PKGS && \
    rpm -V $INSTALL_PKGS && \
    wget https://bintray.com/jfrog/artifactory-pro-rpms/rpm -O bintray-jfrog-artifactory-pro-rpms.repo && \
    mv bintray-jfrog-artifactory-pro-rpms.repo /etc/yum.repos.d/ && \
    yum install -y --enablerepo=centosplus jfrog-artifactory-pro && \
    yum clean all -y

COPY ./root /opt/jfrog/artifactory
COPY run-artifactory.sh /usr/bin/

RUN chmod +x /usr/bin/run-artifactory.sh && \
    mkdir -p /var/opt/jfrog/artifactory/logs/catalina /opt/jfrog/artifactory/logs/ /var/opt/jfrog/artifactory/etc && \
    chown -R 1013:0 /usr/bin/run-artifactory.sh $HOME $ARTIFACTORY_HOME /var/opt/jfrog/artifactory/ /etc/opt/jfrog/ && \
    chmod g+rwx /var/opt/jfrog/artifactory /opt/jfrog/artifactory && \
    chmod 777 /var/opt/jfrog/artifactory/logs /var/opt/jfrog/artifactory/logs/catalina /opt/jfrog/artifactory/logs /var/opt/jfrog/artifactory/etc /opt/jfrog/artifactory/tomcat/ && \
    chgrp 0 /opt/jfrog/artifactory/tomcat/webapps && \
    cp /usr/share/java/postgresql-jdbc3.jar /opt/jfrog/artifactory/tomcat/lib

VOLUME [ "/opt/jfrog/artifactory/tomcat/logs", "/var/opt/jfrog/artifactory/data", "/var/opt/jfrog/artifactory/backup" ]

EXPOSE 8081

USER 1013
ENTRYPOINT [ "/usr/bin/run-artifactory.sh" ]

ENV BUILD_VERSION 1
LABEL build-date="2017-04-21" \
      release="1"
