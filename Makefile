.PHONY: build
.DEFAULT_GOAL := build

MAKEFILE_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

build:
	docker build \
		-f Dockerfile \
		-t nicolaw/tiddlywiki \
		-t nicolaw/tiddlywiki:latest \
		-t tiddlywiki \
		-t tiddlywiki:latest \
		$(MAKEFILE_DIR)
