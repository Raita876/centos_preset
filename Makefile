.PHONY: build
build:
	docker build -t raita/centos .

.PHONY: run
run:
	docker run -it --rm raita/centos

.PHONY: test
test:
	container-structure-test test --image raita/centos --config test-centos-container.yaml