build:
	node_modules/.bin/coffee -o build/ -c schema.coffee

test:
	node_modules/.bin/jasmine-node --coffee spec/

.PHONY: build test
