SHELL := /usr/bin/env bash

TUTS := $(wildcard Tut*)

all: ${TUTS}
	echo -e "\033[32mRun for: $(TUTS)\033[m"

$(TUTS):
	+echo "Building: '$@'"
	+$(MAKE) --directory="$@" --file="../makefile.meta" tut
	mkdir -p pdfs
	cp $@/*.pdf pdfs/
	ls pdfs

docker:
	docker build --pull --tag "mydocker" --file "Dockerfile" .