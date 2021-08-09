
VENV ?= .venv
IMAGE_REPO ?= "debian"
IMAGE_TAG ?= "buster-20210721-slim"
IMAGE_USER ?= "bitsyai"
.PHONY: setup

$(VENV):
	python3 -m venv $(VENV)
	$(VENV)/bin/pip install --upgrade pip setuptools wheel pip-tools
	$(VENV)/bin/pip install -r molecule/requirements.txt

setup: $(VENV)

clean:
	rm -rf $(VENV)
	rm -rf molecule/default/.tmp

image:
	docker build \
		--tag $(IMAGE_USER)/$(IMAGE_REPO):$(IMAGE_TAG) \
		-f tools/Dockerfile \
		.
	docker push $(IMAGE_USER)/$(IMAGE_REPO):$(IMAGE_TAG)