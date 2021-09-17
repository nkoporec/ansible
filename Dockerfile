FROM carlodepieri/docker-archlinux-systemd
ARG TAGS
WORKDIR /usr/local/bin
RUN pacman -Syy
RUN pacman -Sy --noconfirm --needed git ansible curl base-devel openssh
RUN useradd -ms /bin/bash nkoporec
RUN echo "nkoporec:nkoporec" | chpasswd
RUN echo '%nkoporec ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
COPY . .
