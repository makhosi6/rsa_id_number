.PHONY: setup-fvm test coverage open all publish publist get upgrade deps-check

ifeq ($(OS),Windows_NT)
$(error Unsupported platform: this Makefile requires macOS or Linux shell support)
endif

UNAME_S := $(shell uname -s 2>/dev/null)
ifneq ($(filter Darwin Linux,$(UNAME_S)),)
else
$(error Unsupported platform: detected "$(UNAME_S)". Only macOS (Darwin) and Linux are supported)
endif

FVM ?= $(shell command -v fvm 2>/dev/null || echo "$(HOME)/.pub-cache/bin/fvm")
FLUTTER ?= $(FVM) flutter
DART ?= $(FVM) dart

setup-fvm:
	@if command -v fvm >/dev/null 2>&1; then \
		echo "fvm is already installed."; \
	else \
		echo "fvm not found. Installing via dart pub global activate fvm..."; \
		dart pub global activate fvm; \
	fi

test: setup-fvm
	$(FLUTTER) test --coverage

coverage: test
	genhtml coverage/lcov.info -o coverage/html

# Open the coverage in the browser
open: coverage
	open coverage/html/index.html

# Full pipeline: run tests, generate coverage report, and open it
all: open


# Publish package to pub.dev.
publish: setup-fvm
	$(DART) pub publish

