# Artifactory

This is Artifactory on OpenShift, a containerized version of Artifactory OSS
with an OpenShift template.

## Building the Container Image

Please change to `container-image` and have a look at the `Makefile`, change
`REPOSITORY_NAME` according to your needs.

A simple `make push` should do the rest.

## Using the Template

An OpenShift template is provided and could be used to instanciate new Artifactory
applications. Therefore the template needs to be created on OpenShift: `oc create -f openshift-template.yaml`.
This assumes that you have create a project on OpenShift, for detailed instruction
see Creating a Project[https://docs.openshift.org/latest/dev_guide/projects.html#create-a-project].

## Deploying Artifactory

Deploying Artifactory on OpenShift is a simple step of instanciating a new
application on OpenShift: `oc new-app artifactory`.

## Using Artifactory

Point your browser at the domainname of the route created by the template, use
`oc get route` to see the current value.

## Open Issues

### PostgreSQL Integration

### Migration

### Backup

## Copyright

Copyright (C) 2016 Red Hat Inc.

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program. If not, see <http://www.gnu.org/licenses/>.

The GNU General Public License is provided within the file [LICENSE](LICENSE).
