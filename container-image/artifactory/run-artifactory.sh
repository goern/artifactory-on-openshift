#!/bin/sh

echo "This is Artifactory ${ARTIFACTORY_VERSION}-${BUILD_VERSION}"

echo "Current Environment"
env

ln -sf /opt/jfrog/artifactory/bin /var/opt/jfrog/artifactory/bin

cat >> /opt/jfrog/artifactory/etc/db.properties <<-EOF
type=postgresql
driver=org.postgresql.Driver
url=jdbc:postgresql://${ARTIFACTORY_POSTGRESQL_SERVICE_HOST}:${ARTIFACTORY_POSTGRESQL_SERVICE_PORT}/${DATABASE_NAME}
username=${DATABASE_USER}
password=${DATABASE_PASSWORD}
EOF

echo "Current storage configuration"
cat /opt/jfrog/artifactory/etc/db.properties

cd /var/opt/jfrog/artifactory/bin/
./artifactory.sh
