FROM python:3.7.1
RUN mkdir -p /data2/vespene
COPY requirements.txt Makefile /data2/
WORKDIR /data2
RUN make requirements
RUN mkdir -p /etc/vespene/settings.d /tmp/vespene/build_root /var/log/vespene
COPY docker-database.py /etc/vespene/settings.d/database.py
COPY docker-logging.py /etc/vespene/settings.d/logging.py
COPY manage.py /data2/
COPY vespene/ /data2/vespene/
ENV BUILD_ROOT = "/tmp/vespene/build_root"
RUN make secrets
COPY docker-run.sh /tmp/
RUN chmod 777 /tmp/docker-run.sh
RUN mkdir /data
WORKDIR /data
EXPOSE 8000
CMD [ "python","manage.py", "runserver", "0.0.0.0:8000" ]