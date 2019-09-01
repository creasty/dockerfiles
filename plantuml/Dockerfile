FROM java:8-jre-alpine

ENV LANG en_US.UTF-8
ENV PLANTUML_VERSION 1.2019.9
ENV GRAPHVIZ_DOT /usr/bin/dot

RUN apk add --no-cache \
  graphviz \
  ttf-droid \
  ttf-droid-nonlatin \
  wget

RUN wget "https://downloads.sourceforge.net/project/plantuml/${PLANTUML_VERSION}/plantuml.${PLANTUML_VERSION}.jar" \
  -O /usr/share/plantuml.jar

ENTRYPOINT ["java", "-Djava.awt.headless=true", "-jar", "/usr/share/plantuml.jar"]
