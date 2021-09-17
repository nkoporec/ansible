FROM carlodepieri/docker-archlinux-systemd
ARG TAGS
WORKDIR /usr/local/bin
RUN pacman -Syy
RUN pacman -Sy --noconfirm --needed git ansible curl base-devel openssh
RUN useradd -ms /bin/bash nkoporec
COPY . .
