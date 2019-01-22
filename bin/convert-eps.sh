#!bin/bash

for file in ./img/*; do
  if [ ! -f ${file%.*}.eps ]; then
    echo convert $file
    convert $file ${file%.*}.eps
  fi
done

