.PHONY: build
build:
	docker build -t raita/centos .
.PHONY: run
run:
	docker run -it --rm raita/centos
	