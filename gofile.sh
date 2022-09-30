#!/bin/bash
HOST=fdcl-mws

if [[ $1 == "put" ]]; then
  rsync $(pwd) $HOST:workspace/. --exclude="__pycache__" --exclude=".*" -av ${@:2}
elif [[ $1 == "get" ]]; then
	rsync $HOST:workspace/$(basename $(pwd))/$2 $(pwd)/$2 -av ${@:3}
fi
