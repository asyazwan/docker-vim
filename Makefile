base:
	docker build -t asyazwan/vim .

plugins:
	sh -c 'docker build -f Dockerfile.plugins -t asyazwan/vim:syazwan \
		--squash \
		--build-arg USERNAME=$(shell id -un) \
		--build-arg GROUPNAME=$(shell id -gn) \
		--build-arg UID=$(shell id -u) \
		--build-arg GID=$(shell id -g) \
		--build-arg WORKSPACE=$$HOME \
		--build-arg SHELL=/usr/bin/fish .'

ifeq (run,$(firstword $(MAKECMDGOALS)))
  # use the rest as arguments for "run"
  DIR := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  # ...and turn them into do-nothing targets
  $(eval $(DIR):;@:)
endif

run:
	docker run --rm -it \
		--hostname vim \
		-v "$(word 2,$(MAKECMDGOALS))":$$HOME/dev/ asyazwan/vim:syazwan

.PHONY: run
