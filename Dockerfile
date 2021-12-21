FROM ubuntu:21.10

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
          libxkbcommon-x11-0

COPY ./Pixum/ /opt/Pixum/


ARG UID
ARG GID
RUN mkdir -p /home/pixumuser && \
    echo "pixumuser:x:${UID}:${GID}:Pixum User,,,:/home/pixumuser:/bin/bash" >> /etc/passwd && \
    echo "pixumuser:x:${UID}:" >> /etc/group && \
    echo "pixumuser ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/pixumuser && \
    chmod 0440 /etc/sudoers.d/pixumuser && \
    chown ${UID}:${GID} -R /home/pixumuser

USER pixumuser
ENV HOME /home/pixumuser
WORKDIR /home/pixumuser
