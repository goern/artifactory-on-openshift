REPOSITORY_NAME := docker.io/goern
ARTIFACTORY_VERSION := 4.13.2

.PHONY: all push clean
all:
	docker build --tag $(REPOSITORY_NAME)/artifactory-oss:$(ARTIFACTORY_VERSION) .

push: all
	docker push $(REPOSITORY_NAME)/artifactory-oss:$(ARTIFACTORY_VERSION)

clean:
	docker rmi $(REPOSITORY_NAME)/artifactory-oss:$(ARTIFACTORY_VERSION)
