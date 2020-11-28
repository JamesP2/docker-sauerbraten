image-name := sauerbraten

.DEFAULT_GOAL := image

image-base:
	docker build -f Dockerfile.base -t $(image-name)-base .

bash: image-base
	docker build -f Dockerfile.bash -t $(image-name)-bash .
	docker run --name $(image-name)-bash -ti --rm $(image-name)-bash

image: image-base
	docker build -f Dockerfile -t $(image-name) .
