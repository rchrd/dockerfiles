#!/bin/sh

set -eo pipefail

if [ -z "${DSMR_USER}" ] || [ -z "$DSMR_EMAIL" ] || [ -z "${DSMR_PASSWORD}" ]; then
  echo "DSMR web credentials not set. Exiting."
  exit 1
fi

if [ -z "${DB_HOST}" ] || [ -z "$DB_USER" ] || [ -z "${DB_PASS}" ] || [ -z "${DB_NAME}" ]; then
  echo "Database credentials not set. Exiting."
  exit 1
fi

# Check if we're able to connect to the database instance
# already. The port isn't required for postgresql.py but
# it is added for the sake of completion.
DB_PORT=${DB_PORT:-5432}

cmd="/usr/bin/pg_isready -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DB_NAME -t 1"

timeout=60
while ! $cmd >/dev/null 2>&1; do
  timeout=$(expr $timeout - 1)
  if [[ $timeout -eq 0 ]]; then
    echo "Could not connect to database server. Aborting..."
    return 1
  fi
  echo -n "."
  sleep 1
done
echo

# Run migrations
python3 manage.py migrate --noinput
python3 manage.py collectstatic --noinput

# Create an admin user
python3 manage.py shell -i python << PYTHON
from django.contrib.auth.models import User
if not User.objects.filter(username='${DSMR_USER}'):
  User.objects.create_superuser('${DSMR_USER}', '${DSMR_EMAIL}', '${DSMR_PASSWORD}')
  print('${DSMR_USER} created')
else:
  print('${DSMR_USER} already exists')
PYTHON

# Run supervisor
supervisord -c /etc/supervisor/conf.d/supervisord.conf
