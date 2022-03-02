#!/bin/bash
set -e

echo "Deployment started ..."

# Enter maintenance mode or return true
# if already is in maintenance mode
(php artisan down) || true

# Pull the latest version of the app
composer install

# Install composer dependencies
php artisan migrate

# Clear the old cache
php artisan serve

# Exit maintenance mode
php artisan up

echo "Deployment finished!"
