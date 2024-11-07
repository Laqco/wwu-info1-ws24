SHELL := /usr/bin/env bash

TUTS := $(wildcard Tut*)

all: ${TUTS} collect
    echo -e "\033[32mRun for: $(TUTS)\033[m"

$(TUTS):
	+echo "Building: '$@'"
	+$(MAKE) --directory="$@" --file="../makefile" tut

collect:
    mkdir -p pdfs
    cp Tut*/*.pdf pdfs/

docker:
	docker build --pull --tag "mydocker" --file "Dockerfile" .

############

PDFS := $(addsuffix .pdf,$(basename $(shell ls *.tex)))
__FILENAME := ""

tut: ${PDFS}

%.pdf: __FILENAME = $(addsuffix .tex, $(basename $@))
    $(dockerrun)

define dockerrun
    echo Compiling file: ${__FILENAME}
    sltx raw-compile "${__FILENAME}"
endef