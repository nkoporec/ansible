FROM archlinux:latest
ARG TAGS
WORKDIR /usr/local/bin
RUN pacman -Syy
RUN pacman -S --noconfirm --needed git ansible curl base-devel
COPY . .
CMD ["sh", "-c", "ansible-playbook $TAGS local.yml"]
