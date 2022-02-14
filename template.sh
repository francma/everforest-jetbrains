#!/bin/sh
set -eu

export $(cat $@ | xargs)

envsubst < /dev/stdin