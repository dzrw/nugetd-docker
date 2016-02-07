SHELL=/bin/bash

REPO := politician/nugetd
TAG ?= 0.2

.PHONY: build shell

default: build

build:
	docker build -t $(REPO):$(TAG) .

serve:
	docker run -d \
		-v `pwd`/examples/packages:/usr/share/nugetd/packages \
		-v `pwd`/examples/packages.yml:/usr/share/nugetd/packages.yml \
		-p 9000:8080 \
		$(REPO):$(TAG)

shell:
	docker run --rm  -t -i $(REPO):$(TAG) /bin/sh
