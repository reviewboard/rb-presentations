#!/bin/sh

DIRNAME="png/`basename $1 .list`"
FILES=""

mkdir -p $DIRNAME

for file in `cat $1`
do
	png_file="$DIRNAME/`basename $file .svg`.png"
    echo "Creating $png_file"
	inkscape -z -e $png_file $file
	FILES="$FILES $png_file"
done
