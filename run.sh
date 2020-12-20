#!/bin/bash

echo "start mirroring this repo"

GIT_FULL_URL="https://${GIT_MIRROR_USER}:${GIT_MIRROR_TOKEN}@${REMOTE_MIRROR_REPO}"
echo ${GIT_FULL_URL}

git checkout ${DRONE_BRANCH}
git push ${GIT_FULL_URL} ${DRONE_BRANCH}

echo "start mirroring this repo" 
