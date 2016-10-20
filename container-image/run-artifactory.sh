#!/bin/sh

echo "This is Artifactory ${ARTIFACTORY_VERSION}-${BUILD_VERSION}"

# TODO implement configuring the database connection

${ARTIFACTORY_HOME}/bin/artifactory.sh
