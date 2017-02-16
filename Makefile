stable-watermark: shared-doc
	cat container-image/reverse-proxy-nginx/conf.d/artifactory.conf | sed s/-acme-dev-infra.apps.acme.e2e.bos.redhat/.example/ | sed s/acme-dev-infra-artifactory.acme.e2e.bos.redhat.com/artifactory.example.com/ >tmp-artifactory-conf
	docker run --privileged=true -v `pwd`:/paper -i -t docker-registry.usersys.redhat.com/asciidoctor:stable-alpha10-v1 asciidoctor-pdf -a pdf-style=asciidoctor-watermark -r asciidoctor-diagram RefArch-Artifactory-on-OCP.asciidoc

stable-no-watermark:
	docker run --privileged=true -v `pwd`:/paper -i -t docker-registry.usersys.redhat.com/asciidoctor:stable-alpha10-v1 asciidoctor-pdf -a pdf-style=asciidoctor-no-watermark -r asciidoctor-diagram RefArch-Artifactory-on-OCP.asciidoc

dev-no-watermark:
	docker run --privileged=true -v `pwd`:/paper -i -t docker-registry.usersys.redhat.com/asciidoctor:dev-2015-11-17 ruby /asciidoctor-pdf/bin/asciidoctor-pdf -a pdf-style=asciidoctor-no-watermark -r asciidoctor-diagram RefArch-Artifactory-on-OCP.asciidoc

dev-watermark:
	docker run --privileged=true -v `pwd`:/paper -i -t docker-registry.usersys.redhat.com/asciidoctor:dev-2015-11-17 ruby /asciidoctor-pdf/bin/asciidoctor-pdf -a pdf-style=asciidoctor-watermark -r asciidoctor-diagram RefArch-Artifactory-on-OCP.asciidoc

clean:
	find . -type f -name RefArch-ContentAndSecurityManagement.pdf -exec rm -f {} \;
	find . -type f -name \*.pdfmarks -exec rm -f {} \;
	rm -f tmp-artifactory-conf

shared-doc:
	git submodule update --remote
