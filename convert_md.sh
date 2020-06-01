#!/bin/bash

set -x

case "$OSTYPE" in
  linux*)
    docker-compose run --rm --user=$(id -u $USER) app --allow-local-files "$@"
    ;;
  *)
    docker-compose run --rm app --allow-local-files "$@"
    ;;
esac
