#!bin/bash

echo -n 'Dockerを起動してください. 起動できましたか? (Y/n):'
read yn
if [ $yn = "Y" ]; then
	docker pull paperist/alpine-texlive-ja
fi

