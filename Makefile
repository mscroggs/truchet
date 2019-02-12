THIS = tikz-truchet
HERE = $(shell pwd)
OUTPUT = $(HERE)
MYTMP = $(HERE)/tmp
TEXOUT = $(OUTPUT)
STYOUT = $(OUTPUT)

.PHONY: all ctan sty doc zip

all: sty doc ctan

ctan: sty doc zip

sty:
	mkdir -p $(STYOUT);latex -output-directory=$(STYOUT) tikz-truchet.ins

doc:
	mkdir -p $(TEXOUT);pdflatex -output-directory=$(TEXOUT) tikz-truchet.dtx

zip:
	mkdir -p $(OUTPUT);rm -rf $(MYTMP);mkdir -p $(MYTMP)/zip/$(THIS);cd $(MYTMP)/zip;cp $(HERE)/README.md $(TEXOUT)/tikz-truchet.pdf $(HERE)/tikz-truchet.dtx $(HERE)/tikz-truchet.ins $(THIS);zip -r tikz-truchet .;cp tikz-truchet.zip $(OUTPUT)
