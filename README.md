# Artifactory

This is Artifactory on OpenShift, a containerized version of Artifactory with an OpenShift template.

## Deploying Artifactory

For a detailed description see Artifactory.asciidoc

## Using Artifactory

Point your browser at the domainname of the route created by the template, use
`oc get route` to see the current value.

TIP: Any changes you do to the config files will be overwritten by the values
obtained from the ConfigMap `artifactory-default-config`. Infrastructure is immutable!

## Limitations

The PostgreSQL service create by the provided template is a single node, so
there is no redundancy or scale up...

The Artifactory service has no scale up feature, it must not be scale to more
than one pod.

Storage configuration of Artifactory expects to use PostgreSQL, its hard coded
within the entrypoint of the container image.

## Copyright

Copyright (C) 2016,2017 Red Hat Inc.

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
