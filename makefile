SHELL := /usr/bin/env bash

TUTS := $(wildcard Tut*)

all: ${TUTS} collect
	echo -e "\033[32mRun for: $(TUTS)\033[m"

$(TUTS):
	+echo "Building: '$@'"
	+$(MAKE) --directory="$@" --file="../makefile.meta" tut

collect:
	mkdir -p pdfs
	cp Tut*/*.pdf pdfs/

docker:
	docker build --pull --tag "mydocker" --file "Dockerfile" .