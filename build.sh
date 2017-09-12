#!/bin/bash
BUILDDIR=build

if [ -d "${BUILDDIR}" ]; then
    rm -rf "${BUILDDIR}"
fi
mkdir "${BUILDDIR}"

pushd l10n/langs
export LANGS=`ls`
for d in $LANGS; do
    # Only build document if translation has been done
    if [ `ls -1 ${d} | wc -l` -gt "0" ]; then
        echo "Processing ${d}"
        mkdir -p ../../build/${d}
        cp -r ../../images ../../build/${d}
        cp -r ../../js ../../build/${d}
        pushd ${d}
        # index.adoc is not translated, so grab the source version
        cp ../../../index.adoc ./
        asciidoctor -b html5 -o ../../../build/${d}/help.html index.adoc
        if [ -d "images" ]; then
            # if images directory exists, copy contents to build directory
            cp images/* ../../../build/${d}/images/
        fi
        rm index.adoc
        popd
    else
        echo "${d} translation is incomplete, skipping..."
    fi
done
popd
