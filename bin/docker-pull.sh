#!bin/bash

read --prompt="echo 'Dockerを起動してください. 起動できましたか? (Y/n):'" yn
if [ $yn = "Y" ]; then
	docker pull paperist/alpine-texlive-ja
fi

