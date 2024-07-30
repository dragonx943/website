# Use a base image
FROM alpine:latest

# Install
RUN echo 'http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories && \
    chmod 755 /etc && \
    apk update && \
    apk upgrade && \
    apk add --update shadow util-linux pciutils coreutils binutils findutils grep bash bash-completion openssl curl openssh-client sudo shellinabox
    
RUN echo 'root:root' | chpasswd && passwd -u root
RUN adduser -D dra \
    && echo 'dra:0' | chpasswd && passwd -u dra
RUN echo 'dra     ALL=(ALL:ALL) ALL' >> /etc/sudoers
RUN echo "dra ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Expose
EXPOSE 4200

# Start
CMD ["/usr/bin/shellinaboxd", "-t", "-s", "/:LOGIN"]
