#!/bin/sh

# check if the PHP version is set in command arguments and set the Docker container
ARGUMENTS=""
CONTAINER="php"
while [ $# -gt 0 ]; do
  case "$1" in
    --php-ver=8)
      CONTAINER="php8"
      ;;
    --php-ver=7.1)
      CONTAINER="php7_1"
      ;;
    --php-ver=*)
      output "Wrong php version (use --php-ver=7.1 or --php-ver=8). Default is 7.2." "error"
      exit 1
      ;;
    *)
      ARGUMENTS=$ARGUMENTS$1" "
      ;;
  esac
  shift
done

# recreate command arguments without the PHP version argument
set -- "$@" "$ARGUMENTS"

# check the PHP version and set the vendor
source="/var/www/vendors/$CONTAINER"
docker-compose exec "$CONTAINER" mkdir -p "$source"
destination="/var/www/code/vendor"
docker-compose exec "$CONTAINER" rm -rf "$destination"
docker-compose exec "$CONTAINER" ln -s "$source" "$destination"
