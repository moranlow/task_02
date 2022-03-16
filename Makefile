.PHONY: deps

deps:
	pip install -r requirements.txt;
		pip install -r test_requirements.txt

docker_build:
	docker build -t hello-world-printer .

docker_run: docker_build
	docker run \
		--name hello-world-printer-dev \
		-p 5000:5000 \
		-d hello-world-printer

- name: Set up QEMU
uses: docker/setup-qemu-action@v1
- name: Set up Docker Buildx
uses: docker/setup-buildx-action@v1
- name: Build and export to Docker
uses: docker/build-push-action@v2
with:
	context: .
	load: true