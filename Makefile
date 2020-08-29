.PHONY: build
.DEFAULT_GOAL := build

DATETIME := $(shell date +"%Y%m%d%H%M")
MAKEFILE_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

build:
	docker build \
		-f Dockerfile \
		-t nicolaw/tiddlywiki \
		-t nicolaw/tiddlywiki:$(DATETIME) \
		-t nicolaw/tiddlywiki:latest \
		-t tiddlywiki \
		-t tiddlywiki:$(DATETIME) \
		-t tiddlywiki:latest \
		$(MAKEFILE_DIR)
