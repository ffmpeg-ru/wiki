.DEFAULT_GOAL := serve

.PHONY: serve
serve:
	@docker run --rm -it -v $(PWD):/docs -w /docs -p 8000:8000 squidfunk/mkdocs-material:7.3.6 serve -f ./mkdocs.yml -a 0.0.0.0:8000

.PHONY: build
build:
	mkdocs build

.PHONY: deploy
deploy:
	mkdocs gh-deploy --force
