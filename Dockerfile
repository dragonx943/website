# Use a base image
FROM alpine:latest

# Install
RUN echo 'http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories && \
    chmod 755 /etc && \
    apk update && \
    apk upgrade && \
    apk add --update shadow util-linux pciutils coreutils binutils findutils grep bash bash-completion openssl curl openssh-client sudo shellinabox
    
RUN echo 'root:root' | chpasswd && passwd -u root

# Expose
EXPOSE 4200

# Start
CMD ["/usr/bin/shellinaboxd", "-t", "-s", "/:LOGIN"]
