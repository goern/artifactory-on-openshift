# Artifactory

This is Artifactory on OpenShift, a containerized version of Artifactory OSS
with an OpenShift template.

It is a proof of concept, Version 1.0.0

## Deploying Artifactory

For a detailed description see Artifactory.asciidoc

## Using Artifactory

Point your browser at the domainname of the route created by the template, use
`oc get route` to see the current value.

TIP: Any changes you do to the config files will be overwritten by the values
obtained from the ConfigMap `artifactory-default-config`. Infrastructure is immutable!

## Open Issues

### PostgreSQL Integration

### Migration

### Backup

### Liveness Probe

Have a look at it again...

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
