FROM java:8-jre-alpine

ENV LANG en_US.UTF-8
ENV PLANTUML_VERSION 8056
ENV GRAPHVIZ_DOT /usr/bin/dot

RUN apk add --no-cache \
  bash \
  graphviz \
  ttf-droid \
  ttf-droid-nonlatin \
  wget

RUN wget "https://downloads.sourceforge.net/project/plantuml/plantuml.${PLANTUML_VERSION}.jar" \
  -O /usr/share/plantuml.jar

COPY ./entrypoint.sh /usr/share/entrypoint.sh
ENTRYPOINT ["/usr/share/entrypoint.sh"]
