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
      fonts-lmodern \
      fonts-noto-cjk \
      fonts-texgyre \
      ghostscript \
      gsfonts \
      lmodern \
      mecab \
      mecab-ipadic-utf8 \
      poppler-data \
      tex-gyre \
      texlive-fonts-recommended \
      texlive-lang-japanese \
      texlive-latex-extra \
      texlive-pictures \
      wget \
      xzdec \
      zip \
    && apt-get clean

# Use noto for uplatex
ADD noto/ /usr/share/texlive/texmf-dist/fonts/map/dvipdfmx/ptex-fontmaps/noto/
RUN texhash && kanji-config-updmap-sys noto

# Update software
RUN tlmgr init-usertree \
  && tlmgr update --self --all

RUN set -x \
  && tlmgr install algorithmicx \
  && sudo tlmgr install algorithms \
  && sudo tlmgr install boondox \
  && sudo tlmgr install etoolbox \
  && sudo tlmgr install fontaxes \
  && sudo tlmgr install newtx \
  && sudo tlmgr install vaucanson-g

# Configure texmf
ADD texmf.cnf /usr/local/texlive/texmf-local/web2c/texmf.cnf
RUN sudo mktexlsr
