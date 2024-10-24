:: set docker settings
SET DOCKER_USER=oislen
SET DOCKER_REPO=cat-classifier
SET DOCKER_TAG=latest
SET DOCKER_IMAGE=%DOCKER_USER%/%DOCKER_REPO%:%DOCKER_TAG%
SET DOCKER_CONTAINER_NAME=cc
SET GIT_BRANCH=v0.0.0

:: remove existing docker containers and images
docker rm -f %DOCKER_IMAGE%

:: build docker image
call docker build --no-cache -t %DOCKER_IMAGE% . --build-arg GIT_BRANCH=%GIT_BRANCH%

:: run docker container
SET UBUNTU_DIR=/home/ubuntu
call docker run --name %DOCKER_CONTAINER_NAME% --shm-size=512m --publish 8888:8888 --volume E:\GitHub\Cat-Classifier\.cred:/home/ubuntu/Cat-Classifier/.cred  --volume E:\GitHub\Cat-Classifier\report:/home/ubuntu/Cat-Classifier/report -it %DOCKER_IMAGE%

:: useful docker commands
:: docker images
:: docker ps -a
:: docker exec -it {container_hash} /bin/bash
:: docker stop {container_hash}
:: docker start -ai {container_hash}
:: docker rm {container_hash}
:: docker image rm {docker_image}
:: docker push {docker_image}
