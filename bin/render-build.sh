
#!/usr/bin/env bash

set -o errexit

bundle install
bin/rails assets:precompile
bin/rails assets:clean

if [ -n "$DATABASE_URL" ]; then
    bin/rails db:prepare
else
    echo "DATABASE_URL no está definido; se omite preparación de base de datos."
fi