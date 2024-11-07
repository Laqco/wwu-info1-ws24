SHELL := /usr/bin/env bash

FILES = $(find . -name "*.sty")

.PHONY: all %.sty

all:
	mkdir -p ./texinputs/tex/latex
	export TEXINPUTS=./texinputs//:

color-palettes/color-palettes.sty: all
	cd ./texinputs/tex/latex
	git clone https://github.com/EagleoutIce/color-palettes.git

beamer-themes/colorful-dream/beamerthemecolorful-dream.sty: all
	cd ./texinputs/tex/latex
	git clone https://github.com/EagleoutIce/beamer-themes.git

code-animation/code-animation.sty: all
	cd ./texinputs/tex/latex
	git clone https://github.com/EagleoutIce/code-animation.git

sopra-collection/sopra-listings/sopra-listings.sty: all
	cd ./texinputs/tex/latex
	git clone https://github.com/EagleoutIce/sopra-collection.git