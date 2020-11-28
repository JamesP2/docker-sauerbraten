FROM ubuntu:focal
MAINTAINER James Phillips <jamesp2.phillips@gmail.com>

WORKDIR /opt

RUN apt-get update && apt-get install -y \
  dumb-init \
  libgl1-mesa-glx \
  libsdl-image1.2 \
  libsdl-mixer1.2 \
  libsdl1.2debian \
  libx11-6 \
  wget

RUN wget -O sauerbraten.tar.bz2 https://sourceforge.net/projects/sauerbraten/files/sauerbraten/2013_01_04/sauerbraten_2013_04_04_collect_edition_linux.tar.bz2/download
RUN tar xjf sauerbraten.tar.bz2

WORKDIR /opt/sauerbraten

EXPOSE 28785/udp 28785/tcp 28786/udp 28786/tcp
