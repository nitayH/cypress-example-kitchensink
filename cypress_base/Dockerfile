# syntax=docker/dockerfile:1
FROM nikolaik/python-nodejs:python3.11-nodejs16

RUN apt-get update && \
  apt-get install --no-install-recommends -y \
  libgtk2.0-0 \
  libgtk-3-0 \
  libnotify-dev \
  libgconf-2-4 \
  libgbm-dev \
  libnss3 \
  libxss1 \
  libasound2 \
  libxtst6 \
  procps \
  xauth \
  xvfb \
  xsel \ 
  # install text editors
  # vim-tiny \
  # nano \
  # install emoji font
  # fonts-noto-color-emoji \
  # install Chinese fonts
  # this list was copied from https://github.com/jim3ma/docker-leanote
  # fonts-arphic-bkai00mp \
  # fonts-arphic-bsmi00lp \
  # fonts-arphic-gbsn00lp \
  # fonts-arphic-gkai00mp \
  # fonts-arphic-ukai \
  # fonts-arphic-uming \
  # ttf-wqy-zenhei \
  # ttf-wqy-microhei \
  # xfonts-wqy \
  # clean up
  && rm -rf /var/lib/apt/lists/* \
  && apt-get clean

RUN npm install --unsafe-perm exp -g cypress@10.7 @neuralegion/cypress-har-generator @cypress/code-coverage cypress-terminal-report @cypress/webpack-preprocessor


