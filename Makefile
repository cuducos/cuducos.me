.PHONY: build

build:
	@which marmite >/dev/null 2>&1 || (echo "Installing marmite..."; curl -sS https://marmite.blog/install.sh | sh)
	@marmite . dist
