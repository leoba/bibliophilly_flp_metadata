#!/bin/bash
FILES=docx/*

for f in $FILES
do
    ../Stylesheets/bin/docxtotei $f $f.xml

done