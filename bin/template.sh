#!/bin/sh
set -eu

export $(cat $@ | xargs)

./bin/esh/esh -o - -