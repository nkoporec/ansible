build:
	docker build -t new-arch .
	docker run \
          --env PS1="DAC(\#)[\d \T:\w]\\$ " \
          --interactive \
          --privileged \
          --rm \
          --tty \
          --volume "/tmp/target:/target" \
          new-arch /bin/sh
