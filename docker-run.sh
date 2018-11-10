#!/bin/bash
python manage.py migrate
echo "*** running server now ***"
python manage.py runserver 0.0.0.0:8000
echo "*** runnign server complete at the default port 8000 ***"