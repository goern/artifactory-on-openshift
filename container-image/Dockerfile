FROM openshift/base-centos7

MAINTAINER Christoph Görn <goern@redhat.com>

ENV ARTIFACTORY_VERSION 4.13.2
ENV ARTIFACTORY_HOME /opt/jfrog/artifactory

LABEL io.k8s.display-name="JFrog Artifactory OSS" \
      io.k8s.description="The world’s most advanced repository manager. Artifactory offers powerful enterprise feature and fine-grained permission control behind a sleek and easy-to-use UI." \
      name="JFrog Artifactory OSS" \
      license="GPLv3" \
      build-date="20161020"

WORKDIR /opt/jfrog/artifactory

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

USER 1013

VOLUME [ "/opt/jfrog/artifactory/tomcat/logs"]

CMD [ "/usr/bin/run-artifactory.sh" ]

ENV BUILD_VERSION 1
