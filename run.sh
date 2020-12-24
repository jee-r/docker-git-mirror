#!/bin/bash

#CHECKOUT
echo "Checkout in commited branch"
git checkout ${DRONE_BRANCH}

#ENV
echo "check if env is set"
if [ ! -z $GIT_MIRROR_USER ]; then
    echo "GIT_MIRROR_USER is set : $GIT_MIRROR_USER"
else
    echo "[ERROR] GIT_MIRROR_USER is not set"
fi

if [ ! -z $GIT_MIRROR_REPO ]; then
    echo "GIT_MIRROR_REPO is set : $GIT_MIRROR_USER"
else
    echo "[ERROR] GIT_MIRROR_REPO is not set"
fi

if [ ! -z $GIT_MIRROR_TOKEN ]; then
    echo "mirror token is set (protected): $GIT_MIRROR_USER"
else
    echo "[ERROR] GIT_MIRROR_TOKEN is not set"
fi

#PUSH
echo "start mirroring this repo ..."
git push https://$GIT_MIRROR_USER:$GIT_MIRROR_TOKEN@$REMOTE_MIRROR_REPO $DRONE_BRANCH

exit_code=$?
if [ $exit_code != 0 ]; then
    echo "[ERROR] Mirroring failed ($exit_code)"
    exit 1
else
    echo "Mirroring success"
    exit 0
fi

exit 1
