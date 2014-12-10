from __future__ import print_function

import sys

import docker

print("Python version: %s" % ".".join((str(p) for p in sys.version_info)))

c = docker.Client()
for line in c.build('build-dir', stream=True, nocache=True, rm=True):
	print(line.strip())
