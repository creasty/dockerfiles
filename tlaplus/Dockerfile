#=== Build
#==============================================================================================
FROM debian:9 AS build

RUN set -x \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
    wget openjdk-8-jre-headless build-essential libz-dev \
    ocaml-nox ocaml-native-compilers

WORKDIR /tmp
RUN wget https://github.com/tlaplus/tlaplus/releases/download/v1.7.2/tla2tools.jar

RUN wget https://github.com/tlaplus/tlapm/releases/download/v1.4.5/tlaps-1.4.5-x86_64-linux-gnu-inst.bin
RUN chmod +x tlaps-1.4.5-x86_64-linux-gnu-inst.bin
RUN ./tlaps-1.4.5-x86_64-linux-gnu-inst.bin || true

# RUN wget https://github.com/tlaplus/tlapm/archive/refs/tags/v1.4.5.tar.gz -O tlapm.tar.gz
# RUN tar -xzf tlapm.tar.gz
# RUN set -x \
#   && cd /tmp/tlapm-1.4.5 \
#   && ./configure \
#   && make all \
#   && make install

#=== Runtime
#==============================================================================================
FROM debian:9

RUN set -x \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
    texlive-latex-base openjdk-8-jre-headless \
    procps

WORKDIR /app

COPY --from=build /tmp/tla2tools.jar /usr/lib/
# COPY --from=build /usr/local/bin/zenon /usr/bin/
# COPY --from=build /usr/local/bin/tlapm /usr/bin/
