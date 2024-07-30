# Use a base image
FROM dragonx943/alpine:bot-base

# Install
RUN echo 'root:root' | chpasswd && passwd -u root
RUN adduser -D dra \
    && echo 'dra:0' | chpasswd && passwd -u dra
RUN echo 'dra     ALL=(ALL:ALL) ALL' >> /etc/sudoers
RUN echo "dra ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN addgroup dra wheel
RUN addgroup dra sudo

# Expose
EXPOSE 4200

# Start
CMD ["/usr/bin/shellinaboxd", "-t", "-s", "/:LOGIN"]
