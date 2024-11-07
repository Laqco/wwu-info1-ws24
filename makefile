SHELL := /usr/bin/env bash

TUTS := $(wildcard Tut*)
TARGET_DIR := all_pdfs
VERBOSE := 0

.PHONY: all docker collect ${TUTS}

all: ${TUTS} collect

$(TUTS):
	+echo "Building: '$@'"
	+$(MAKE) --directory="$@" --file="makefile.meta" all

collect:
	mkdir -p ${TARGET_DIR}
	cp Tut*/*.pdf ${TARGET_DIR}/

docker:
	docker build --pull --tag "mydocker" --file "Dockerfile" .

ifeq (${VERBOSE},0)
MAKEFLAGS += --silent
endif