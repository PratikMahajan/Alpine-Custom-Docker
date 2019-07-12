.PHONY: docker \
	docker-build docker-push \
	docker-run kubernetes-run 

DOCKER_TAG_VERSION ?= latest
DOCKER_TAG_C ?= pratikmahajan/alpine-custom:${DOCKER_TAG_VERSION}

# Build and Push to docker hub
docker: docker-build docker-push

# build Docker image
docker-build:
	docker build -t ${DOCKER_TAG_C} .

# Push the docker image to docker hub
docker-push:
	docker push ${DOCKER_TAG_C}

# Runs the docker image on local machine
docker-run:
	docker run -it --rm --net host ${DOCKER_TAG_C} /bin/bash

# Runs the docker image on logged-in kubernetes cluster
kubernetes-run:
	@echo "Image will be deleted from the Kubernetes cluster after exit"
	kubectl run alpine-custom --rm -i --tty --image ${DOCKER_TAG_C} -- bash
