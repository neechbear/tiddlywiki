#
# MIT License
# Copyright (c) 2017-2021 Nicola Worthington <nicolaw@tfb.net>
#
# https://nicolaw.uk
# https://nicolaw.uk/#TiddlyWiki
#

.PHONY: build push
.DEFAULT_GOAL := build

TW_VERSION = 5.2.0
BASE_IMAGE = node:17.0-alpine3.13
REPOSITORY = nicolaw/tiddlywiki
USER       = node

IMAGE_TAGS = $(REPOSITORY):$(TW_VERSION) \
	           $(REPOSITORY):$(TW_VERSION)-$(subst /,,$(subst :,,$(BASE_IMAGE))) \
	           $(REPOSITORY):latest

MAKEFILE_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

build:
	docker $@ \
	  --no-cache \
	  --build-arg TW_VERSION=$(TW_VERSION) \
	  --build-arg BASE_IMAGE=$(BASE_IMAGE) \
	  --build-arg USER=$(USER) \
	  -f Dockerfile \
	  $(addprefix -t ,$(IMAGE_TAGS)) \
	  $(MAKEFILE_DIR)

push:
	for t in $(IMAGE_TAGS) ; do docker $@ $$t ; done

