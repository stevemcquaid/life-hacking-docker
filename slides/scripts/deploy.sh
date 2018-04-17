#!/bin/bash
set -ex

source scripts/common.sh

kubectl apply -f k8s/
