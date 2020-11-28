image-name := sauerbraten 

.DEFAULT_GOAL := image

image:
	docker build -f Dockerfile -t $(image-name) .

bash: image
	docker run --name sauerbraten-bash -ti --rm $(image-name) bash
