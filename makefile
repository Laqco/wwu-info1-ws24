SHELL := /usr/bin/env bash

FILES = $(find . -name "*.sty")

.PHONY: all %.sty

all:
	mkdir -p ./texinputs/tex/latex
	export TEXINPUTS=./texinputs//:

color-palettes.sty: all
	cd ./texinputs/tex/latex
	git clone https://github.com/EagleoutIce/color-palettes.git

colorful-dream.sty: all
	cd ./texinputs/tex/latex
	git clone https://github.com/EagleoutIce/beamer-themes.git

code-animation.sty: all
	cd ./texinputs/tex/latex
	git clone https://github.com/EagleoutIce/code-animation.git

sopra-listings.sty: all
	cd ./texinputs/tex/latex
	git clone https://github.com/EagleoutIce/sopra-collection.git