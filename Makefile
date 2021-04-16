ifeq ($(IMAGE),)
IMAGE = yuccastream/wiki
endif

ifeq ($(VERSION),)
VERSION = latest
endif

ifeq ($(CI_COMMIT_SHORT_SHA),)
CI_COMMIT_SHORT_SHA = $(shell git rev-parse --short HEAD)
endif

.DEFAULT_GOAL := build

.PHONY: build
build:
	@echo '\e[0;32m'"==> Build docker image"'\e[0m'
	docker build --force-rm \
		-t $(IMAGE):$(VERSION) \
		-t $(IMAGE):$(CI_COMMIT_SHORT_SHA) \
		-f Dockerfile .

.PHONY: push
push:
	docker push $(IMAGE):$(VERSION)
	docker push $(IMAGE):$(CI_COMMIT_SHORT_SHA)

.PHONY: serve
serve-ru:
	docker run --rm -it -v $(PWD):/docs -w /docs -p 8000:8000 squidfunk/mkdocs-material:6.1.6 serve -f ./mkdocs.yml -a 0.0.0.0:8000
