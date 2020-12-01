image-name := sauerbraten

.DEFAULT_GOAL := image

bash: image
	docker run --name $(image-name)-bash -ti --rm $(image-name) bash

image:
	docker build -f Dockerfile -t $(image-name) .

run-latest:
	docker run --name $(image-name) --restart unless-stopped -p 28784:28784/udp -p 28785:28785/udp -p 28786:28786/udp -d $(image-name)
