SHELL          := /bin/bash
DOCKERFILE     := Dockerfile
NAME           := rtsp_media_server

all: docker

docker : 
	docker build -f ${DOCKERFILE} -t ${NAME} .

push : docker 
	docker tag ${NAME}:latest ${ECR_REPO}:${NAME}-${TAG_VERSION}
	docker push ${ECR_REPO}:${NAME}-${TAG_VERSION}

runlocal: docker
	docker stop rtsp_camera || true
	docker run --rm -d --network=host -v ${PWD}/videos:/videos --name ${NAME} ${NAME}

stoplocal: docker
	docker stop rtsp_camera || true

