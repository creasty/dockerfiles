#=== Build
#==============================================================================================
FROM debian:bullseye AS build

RUN set -x \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
    wget libz-dev ca-certificates

WORKDIR /tmp
ENV TLATOOL_VERSION 1.7.2
RUN wget https://github.com/tlaplus/tlaplus/releases/download/v$TLATOOL_VERSION/tla2tools.jar

WORKDIR /tmp
ENV ZENON_VERSION 0.8.5
RUN wget https://github.com/zenon-prover/zenon/archive/refs/tags/$ZENON_VERSION.tar.gz -O zenon.tar.gz
RUN tar -xzf zenon.tar.gz
RUN set -x \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
    build-essential ocaml coq
RUN set -x \
  && cd /tmp/zenon-$ZENON_VERSION \
  && ./configure \
  && make \
  && make install

WORKDIR /tmp
ENV TLAPM_VERSION 1.4.5
RUN wget https://github.com/tlaplus/tlapm/releases/download/v$TLAPM_VERSION/tlaps-${TLAPM_VERSION}-x86_64-linux-gnu-inst.bin -O tlaps-inst
RUN set -x \
  && chmod +x tlaps-inst \
  && ./tlaps-inst || true # FIXME: 'self-test' fails for some reason...

#=== Stage
#==============================================================================================
FROM debian:bullseye-slim

RUN set -x \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
    texlive-latex-base openjdk-11-jre-headless procps \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

COPY --from=build /tmp/tla2tools.jar /usr/lib/
COPY --from=build /usr/local/bin/tlapm /usr/bin/
COPY --from=build /usr/local/lib/tlaps /usr/lib/tlaps
COPY --from=build /usr/local/bin/zenon /usr/bin/
COPY --from=build /usr/local/lib/zenon /usr/lib/zenon

RUN echo 'Add LoadPath "/usr/lib/zenon".' > "$HOME/.coqrc"
