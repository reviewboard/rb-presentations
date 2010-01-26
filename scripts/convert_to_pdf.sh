#!/bin/sh

mkdir -p pdf/tmp
FILES=""

for file in `cat $1`
do
	pdf_file="pdf/`basename $file .svg`.pdf"
	inkscape -z -d 120 -A $pdf_file $file
	FILES="$FILES $pdf_file"
done

pdf_name=`basename $1 .list`.pdf

echo "Creating $pdf_name"
pdftk $FILES cat output $pdf_name
