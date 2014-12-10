from __future__ import print_function

import os
import sys

import docker

BUILD_DIR = os.path.join(os.path.dirname(os.path.realpath(__file__)), 'build-dir')
DOCKER_HOST = os.environ.get('DOCKER_HOST', 'unix:///var/run/docker.sock')

print("Python version: %s" % ".".join((str(p) for p in sys.version_info)))
print("Build directory: %s" % BUILD_DIR)
print("Docker host: %s" % DOCKER_HOST)

c = docker.Client(DOCKER_HOST)
for line in c.build(BUILD_DIR, stream=True, nocache=True, rm=True):
	print(line.strip())
