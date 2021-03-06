IMAGE_NAME := postgres-arm-build/postgres:latest


build: ## Build a new image and tag it as the latest
	docker build -t $(IMAGE_NAME) .

deb: ## Grab the deb and metadata files out the container.
	docker create --name build-container-postgres $(IMAGE_NAME)
	docker cp build-container-postgres:/builds/ ./
	docker rm build-container-postgres

tarball: ## Tar the debs up
	mkdir postgres
	mv ./builds/*.deb postgres
	tar -pczf postgres.tar.gz ./postgres

shell: ## Run an interactive shell in a new container and delete it afterwards
	docker run -i -t --rm --entrypoint /bin/bash $(IMAGE_NAME)


.PHONY: build deb shell
