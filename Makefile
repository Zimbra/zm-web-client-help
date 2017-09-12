
BUILDDIR=./Build
LANGS = de en-US es fr it ja nl pt-BR ru zh-CZ zn-HK

targets = $(LANGS)

default: build 

translate:
	@echo Performing translations
	docker run -it --rm -v `pwd`:/src jmeastman/po4a -v -M UTF-8 l10n.cfg

build:
	./build.sh

.PHONY: clean

clean:
	rm -rf ${BUILDDIR}
