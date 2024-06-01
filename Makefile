.PHONY: test coverage open

test:
	flutter test --coverage

coverage: test
	genhtml coverage/lcov.info -o coverage/html

# Open the coverage in the browser
open: coverage
	open coverage/html/index.html

# Full pipeline: run tests, generate coverage report, and open it
all: open
