#!/bin/sh

echo "Waiting for database..."

while ! python manage.py check --database default > /dev/null 2>&1
do
    sleep 2
done

echo "Database is ready."

echo "Running migrations..."
python manage.py migrate --noinput

echo "Collecting static files..."
python manage.py collectstatic --noinput

echo "Starting Gunicorn..."

exec gunicorn \
    --bind 0.0.0.0:8000 \
    config.wsgi:application