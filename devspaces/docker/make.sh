#!/bin/bash

echo "Adding entry to /etc/hosts..." >&2
echo "127.0.0.1 db" >> /etc/hosts

echo "Building App..." >&2
pushd /data
make requirements && \
cp docker-database.py /etc/vespene/settings.d/database.py && \
cp docker-logging.py /etc/vespene/settings.d/logging.py && \
make secrets && \
chmod +x docker-run.sh
popd