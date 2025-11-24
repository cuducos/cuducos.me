.PHONY: build

build:
	@which marmite >/dev/null 2>&1 || pip install marmite
	@marmite . dist
