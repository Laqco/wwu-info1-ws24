SHELL := /usr/bin/env bash

all:
	mkdir -p ./texinputs/tex/latex
	cd ./texinputs/tex/latex
	git clone https://github.com/EagleoutIce/beamer-themes.git
	git clone https://github.com/EagleoutIce/code-animation.git
	git clone https://github.com/EagleoutIce/color-palettes.git
	git clone https://github.com/EagleoutIce/sopra-collection.git
	export TEXINPUTS=./texinputs//: