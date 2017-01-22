#!/bin/bash

f1=filelist
find sql -type f > $f1
find scripts -type f > $f1
awk '{system("./convert/doconvert.sh" $1)}' $f1
