#!/bin/bash

docker run -it --rm -v `pwd`:/src jmeastman/po4a -v -M UTF-8 l10n.cfg
