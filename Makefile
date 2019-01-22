.PHONY: help
.DEFAULT_GOAL := help

install-dependency: ## install dependency for mac
	bash ./bin/installer.sh
	bash ./bin/docker-pull.sh

build: ## build tex file to dvi file
	docker run --rm -v $(PWD):/workdir paperist/alpine-texlive-ja uplatex thesis.tex
	docker run --rm -v $(PWD):/workdir paperist/alpine-texlive-ja uplatex thesis.tex # なぜかrefなどを使うのに二回コンパイルしている
	docker run --rm -v $(PWD):/workdir paperist/alpine-texlive-ja dvipdfmx thesis.dvi
	make clean
	echo "#### DONE ####"

convert-img: ## convert jpeg, jpg, img file to eps file in img directory
	bash ./bin/convert-eps.sh

watch: ## when tex file changed, auto build
	./bin/watcher -dotfiles=false \
		-keepalive \
		-cmd="make build" \
		-list ./thesis.tex ./src/

watch-img: ## when img file is added, convert to eps file.
	./bin/watcher -dotfiles=false \
		-keepalive \
		-cmd="make convert-img" \
		./img

clean: ## remove .toc .aux .dvi
	rm thesis.dvi thesis.toc thesis.aux

test:
	go test -v ./src/target/...
	go test -v ./src/fizzbuzz/...
	go test -v ./src/fibonacci/...

help: ## show help to make
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
