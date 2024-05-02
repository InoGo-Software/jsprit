define IMAGE
jsprit-core
endef

build:
	docker container rm $(IMAGE) || echo 'Does not exist'
	docker build . --progress=plain -t $(IMAGE)
	docker run --name $(IMAGE) $(IMAGE) ls
	docker cp $(IMAGE):/app/jsprit-core.jar ./jsprit-core/target/
