.PHONY: build

build:
	@if [ "$$NETLIFY" != "true" ]; then \
		echo "Error: This build should only run on Netlify"; \
		exit 1; \
	fi
	@pip install marmite==0.2.6
	@marmite . dist
