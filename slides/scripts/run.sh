#!/bin/bash
set -ex

source scripts/common.sh

docker run -it -p 80:80 -v $PWD:/go/src/app --rm stevemcquaid/$PACKAGE_NAME:latest present -http '0.0.0.0:80' -notes



#   -orighost string
#         host component of web origin URL (e.g., 'localhost')