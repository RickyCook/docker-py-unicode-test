#!/bin/bash
echo "Trying python '$1'"

python_location="$(which python$1)"
echo "Using python at '$python_location'"

venv_dir="py$1"
virtualenv -p "$python_location" "$venv_dir"

pip_exec="$venv_dir/bin/pip"
python_exec="$venv_dir/bin/python"

$pip_exec install docker-py
$pip_exec freeze

IMAGE_ID_RE='[a-z0-9]*'
image_id=$($python_exec builder.py | tee /dev/stderr | grep -Eo "Successfully built $IMAGE_ID_RE" | grep -Eo "$IMAGE_ID_RE$")

if [[ -z $image_id ]]; then
	echo "No container found to destroy"
else
	docker rmi $image_id
fi
