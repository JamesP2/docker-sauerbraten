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

RUN wget -O sauerbraten.tar.bz2 https://sourceforge.net/projects/sauerbraten/files/sauerbraten/2020_11_29/sauerbraten_2020_12_27_linux.tar.bz2/download
RUN tar xjf sauerbraten.tar.bz2

WORKDIR /opt/sauerbraten

ADD server-init.cfg /opt/sauerbraten

EXPOSE 28784/udp 28785/udp 28786/udp

CMD ["dumb-init", "/opt/sauerbraten/bin_unix/linux_64_server"]
