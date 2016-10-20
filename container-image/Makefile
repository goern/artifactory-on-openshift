REPOSITORY_NAME := goern-docker-registry.bintray.io/goern
ARTIFACTORY_VERSION := 4.13.2
BUILD := 8

.PHONY: all push clean
all:
	docker build --tag $(REPOSITORY_NAME)/artifactory-oss:$(ARTIFACTORY_VERSION)-$(BUILD) .

push: all
	docker push $(REPOSITORY_NAME)/artifactory-oss:$(ARTIFACTORY_VERSION)-$(BUILD)

clean:
	docker rmi $(REPOSITORY_NAME)/artifactory-oss:$(ARTIFACTORY_VERSION)-$(BUILD)
