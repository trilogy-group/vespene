FROM python:3.7.1
LABEL com.trilogy.company="trilogy" \
      com.trilogy.maintainer.email="jaime.bravo@aurea.com" \
      com.trilogy.maintainer.skype="jabhcl" \
      com.trilogy.product="vespene" \
      com.trilogy.service="devspace" \
      com.trilogy.stage="build" \
      com.trilogy.team="Eng.DevSpacesImport" \
      description="This file generates a docker image containing Vespene Application"

ENV DEBIAN_FRONTEND="noninteractive" \
    BUILD_ROOT="/tmp/vespene/build_root"

ADD setup.sh /
ADD make.sh /
RUN chmod +x setup.sh && ./setup.sh

COPY docker-entrypoint.sh /
RUN chmod +x docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

WORKDIR /data

CMD tail -f /dev/null