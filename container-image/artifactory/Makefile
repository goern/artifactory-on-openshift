REPOSITORY_NAME := goern-docker-registry.bintray.io/goern
ARTIFACTORY_VERSION := 5.1.0
BUILD := 1

.PHONY: push clean pro oss
oss:
	docker build --tag $(REPOSITORY_NAME)/artifactory-oss:$(ARTIFACTORY_VERSION)-$(BUILD) -f Dockerfile.oss .

pro:
	docker build --tag $(REPOSITORY_NAME)/artifactory-pro:$(ARTIFACTORY_VERSION)-$(BUILD) -f Dockerfile.pro .

push: oss pro
	docker push $(REPOSITORY_NAME)/artifactory-oss:$(ARTIFACTORY_VERSION)-$(BUILD)
	docker push $(REPOSITORY_NAME)/artifactory-pro:$(ARTIFACTORY_VERSION)-$(BUILD)

clean:
	docker rmi $(REPOSITORY_NAME)/artifactory-oss:$(ARTIFACTORY_VERSION)-$(BUILD) $(REPOSITORY_NAME)/artifactory-pro:$(ARTIFACTORY_VERSION)-$(BUILD)
