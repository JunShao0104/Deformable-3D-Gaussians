#!/usr/bin/env bash
USER_ID=$(id -u)
GROUP_ID=$(id -g)
PASSWD_FILE=$(mktemp) && echo $(getent passwd $USER_ID) > $PASSWD_FILE
GROUP_FILE=$(mktemp) && echo $(getent group $GROUP_ID) > $GROUP_FILE

docker run -it \
    -e HOME \
    -u $USER_ID:$GROUP_ID \
    -v $PASSWD_FILE:/etc/passwd:ro \
    -v $GROUP_FILE:/etc/group:ro \
    -v /home/lzhao360:$HOME \
    -v /mnt:/mnt \
    --name lzhao360_deformable \
    --gpus=all \
    --ipc=host \
    deformable:latest # TODO: change this image name, container name and home directory accordingly