THIS = truchet
HERE = $(shell pwd)
OUTPUT = $(HERE)
MYTMP = $(HERE)/tmp
TEXOUT = $(OUTPUT)
STYOUT = $(OUTPUT)

.PHONY: all ctan sty doc zip

all: sty doc ctan

ctan: sty doc zip

sty:
	mkdir -p $(STYOUT);latex -output-directory=$(STYOUT) truchet.ins

doc:
	mkdir -p $(TEXOUT);pdflatex -output-directory=$(TEXOUT) truchet.dtx

zip:
	mkdir -p $(OUTPUT);rm -rf $(MYTMP);mkdir -p $(MYTMP)/zip/$(THIS);cd $(MYTMP)/zip;cp $(HERE)/README.md $(TEXOUT)/truchet.pdf $(HERE)/truchet.dtx $(HERE)/truchet.ins $(THIS);zip -r truchet .;cp truchet.zip $(OUTPUT)
