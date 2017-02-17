REPOSITORY_NAME := goern-docker-registry.bintray.io
IMAGE := s2i-node-acme
VERSION := 4-11.13
BUILD := 1

.PHONY: push clean node
node:
	docker build --tag $(REPOSITORY_NAME)/$(IMAGE):$(VERSION)-$(BUILD) -f Dockerfile .

push: node
	docker push $(REPOSITORY_NAME)/$(IMAGE):$(VERSION)-$(BUILD)

clean:
	docker rmi $(REPOSITORY_NAME)/$(IMAGE):$(VERSION)-$(BUILD)
