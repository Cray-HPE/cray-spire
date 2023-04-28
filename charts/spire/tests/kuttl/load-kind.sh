#!/bin/bash
#
# MIT License
#
# (C) Copyright 2023 Hewlett Packard Enterprise Development LP
#
# Permission is hereby granted, free of charge, to any person obtaining a
# copy of this software and associated documentation files (the "Software"),
# to deal in the Software without restriction, including without limitation
# the rights to use, copy, modify, merge, publish, distribute, sublicense,
# and/or sell copies of the Software, and to permit persons to whom the
# Software is furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included
# in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
# THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
# OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
# ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
# OTHER DEALINGS IN THE SOFTWARE.
#

grep image Chart.yaml | awk '{print $2}' | while read -r image; do
  docker pull "$image"
  kind load docker-image "$image"
done

for image in artifactory.algol60.net/csm-docker/stable/postgres-operator:3.0.0 \
  artifactory.algol60.net/csm-docker/stable/docker.io/wrouesnel/postgres_exporter:0.8.2 \
  artifactory.algol60.net/csm-docker/stable/registry.opensource.zalan.do/acid/spilo-12:1.6-p3 \
  artifactory.algol60.net/csm-docker/stable/registry.opensource.zalan.do/acid/spilo-14:2.1-p7 \
  artifactory.algol60.net/csm-docker/stable/registry.opensource.zalan.do/acid/postgres-operator:v1.8.2 \
  artifactory.algol60.net/csm-docker/stable/docker-kubectl:1.19.15; do
  docker pull "$image"
  kind load docker-image "$image"
done
