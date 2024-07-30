# Use a base image
FROM ubuntu:22.04

# Install
RUN apt-get update && \
    apt-get install -y shellinabox && \
    apt-get install -y systemd && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN echo 'root:root' | chpasswd

# Expose
EXPOSE 4200

# Start
CMD ["/usr/bin/shellinaboxd", "-t", "-s", "/:LOGIN"]
