#!/bin/bash
echo "Trying python '$1'"
case $1 in
3*)
	python_exec=python3
	pip_exec=pip3
	;;
*)
	python_exec=python
	pip_exec=pip
	;;
esac

python_location="$(which python$1)"
echo "Using python at '$python_location'"

virtualenv -p "$python_location" "py$1"

source "py$1/bin/activate"
$pip_exec install docker-py
$pip_exec freeze

IMAGE_ID_RE='[a-z0-9]*'
image_id=$($python_exec ./builder.py | tee /dev/stderr | grep -Eo "Successfully built $IMAGE_ID_RE" | grep -Eo "$IMAGE_ID_RE$")

if [[ -z $image_id ]]; then
	echo "No container found to destroy"
else
	docker rmi $image_id
fi

deactivate
