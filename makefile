SHELL := /usr/bin/env bash

all:
    $(dockerrun)

docker:
	docker build --pull --tag 'mydocker' --file 'Dockerfile' .

define dockerrun
    for dir in Tut*
    do
        echo Directory: $dir
        cd $dir
        for texfile in *.tex
        do
            echo Compiling file: $texfile
            sltx raw-compile $texfile
        done
        cd ..
    done
endef