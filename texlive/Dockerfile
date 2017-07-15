FROM debian:stretch-slim

ENV LANG en_US.UTF-8

RUN set -x \
  && apt-get update \
  && apt-get install -y \
    locales \
    git-core \
    curl

RUN set -x \
  && echo "$LANG ${LANG##*\.}" >> /etc/locale.gen \
  && locale-gen "$LANG" \
  && update-locale "$LANG"

RUN set -x \
  && apt-get install -y --no-install-recommends \
      texlive-lang-japanese \
      texlive-fonts-recommended \
      texlive-latex-extra \
      lmodern \
      fonts-lmodern \
      tex-gyre \
      fonts-texgyre
      texlive-pictures \
      ghostscript \
      gsfonts \
      zip \
      mecab \
      mecab-ipadic-utf8 \
      poppler-data \
    && apt-get clean

# NOTE noto serif is experimental. can't install via fonts-noto-cjk now.
# RUN echo "deb http://ftp.jp.debian.org/debian/ stretch-backports main" >> /etc/apt/sources.list
# RUN apt-get update && apt-get -y install fonts-noto-cjk/stretch-backports
ADD https://kmuto.jp/debian/noto/fonts-noto-cjk_1.004+repack3-1~exp1_all.deb /tmp/noto.deb
RUN dpkg -i /tmp/noto.deb && rm /tmp/noto.deb

# use noto for uplatex
ADD noto/ /usr/share/texlive/texmf-dist/fonts/map/dvipdfmx/ptex-fontmaps/noto/
RUN texhash && kanji-config-updmap-sys noto
