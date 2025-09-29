#!/bin/bash
#

PROJ_BIND_MOUNT=""
if [[ $# -lt 1 ]]; then
  echo "no param given, starting claude without project bind mounts"
elif [[ $# -eq 1 ]]; then
  if [[ ! -d $1 ]]; then
    echo "argument provided is not a valid directory"
    exit 1
  fi
  echo "starting claude with project bind mount ${1} on /mnt/Project/$(basename $1)"
  PROJ_BIND_MOUNT="--mount type=bind,src=$1,dst=/mnt/Project/$(basename $1)"
elif [[ $# -gt 1 ]]; then
  echo "too many arguments... exiting"
  exit 1
fi
docker run --rm -it -u aiuser -v aiuser-home:/mnt/aiuser $PROJ_BIND_MOUNT ai-tools:latest /bin/bash -c "cd && claude"
