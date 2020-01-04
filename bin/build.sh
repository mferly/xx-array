#!/bin/sh

<<COMMENT
  Referenced from Dockerfile/Dockerfile-develop
  $1 = dev|prod
  $2 = 0|1
  $3 = dev|production
COMMENT

Fail() {
  echo "ERROR: $@" 1>&2
  exit 1
}

which realpath >/dev/null || Fail "realpath not found"
which php      >/dev/null || Fail "php not found"
which composer >/dev/null || Fail "composer not found"
which yarn     >/dev/null || Fail "yarn not found"

cd "$(realpath "$(dirname "$0")"/..)"

composer update --no-dev --optimize-autoloader
composer dump-autoload --no-dev --classmap-authoritative
composer dump-env $1

APP_ENV=$1 APP_DEBUG=$2 php bin/console cache:clear
APP_ENV=$1 APP_DEBUG=$2 php bin/console cache:warmup

yarn
yarn encore $3