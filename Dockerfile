FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update
RUN apt install -y \
          less \
          unzip \
          wget \
          perl \
          sudo \
          libxcb-xinerama0 \
          libgl1-mesa-glx \
          libglib2.0-dev \
          libdbus-1-3 \
          libnss3 \
          libxcomposite1 \
          libxdamage1 \
          libxrender1 \
          libsdl2-2.0-0 \
          libsnappy1v5 \
          libgomp1 \
          xcb \
          libxcb-icccm4 \
          libxcb-image0 \
          libxcb-keysyms1 \
          libxcb-render-util0 \
          libxcb-shape0 \
          libxcb-xkb1 \
          libxkbcommon-x11-0 \
          libxtst6 \
          libgstreamer-gl1.0-0 \
          gstreamer1.0-libav

# font for pixum
RUN echo "ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true" | debconf-set-selections
RUN apt-get install -y --no-install-recommends fontconfig ttf-mscorefonts-installer
RUN fc-cache -f -v

ARG UID
ARG GID
RUN mkdir -p /home/pixumuser && \
    echo "pixumuser:x:${UID}:${GID}:Pixum User,,,:/home/pixumuser:/bin/bash" >> /etc/passwd && \
    echo "pixumuser:x:${UID}:" >> /etc/group && \
    echo "pixumuser ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/pixumuser && \
    chmod 0440 /etc/sudoers.d/pixumuser && \
    chown ${UID}:${GID} -R /home/pixumuser

COPY ./Pixum/ /opt/Pixum/

USER pixumuser
ENV HOME /home/pixumuser
WORKDIR /home/pixumuser
