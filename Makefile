
VENV ?= .venv

.PHONY: setup

$(VENV):
	python3 -m venv $(VENV)
	$(VENV)/bin/pip install --upgrade pip setuptools wheel pip-tools
	$(VENV)/bin/pip install -r molecule/requirements.txt

setup: $(VENV)

clean:
	rm -rf $(VENV)