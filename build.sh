#!/bin/bash

###############################################
# Create folders, remove old versions

rm -rf min
rm -rf dist

mkdir -p min
mkdir -p dist

###############################################
# Minify every .css file (and merge into dist/lori.css)

cd src

for f in *.css; do
	NEWFILENAME=$(basename $f .css).min.css
	uglifycss $f > ../min/$NEWFILENAME
	cat $f >> ../dist/lori.css
done

###############################################
# Merge the minified .min.css files into dist/lori.min.css

cd ..
cd min

for f in *.min.css; do
	cat $f >> ../dist/lori.min.css
done
