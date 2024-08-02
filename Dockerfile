# Use a base image
FROM dragonx943/alpine:deploy

# Install
RUN echo 'root:root' | chpasswd && passwd -u root
RUN adduser -h /home/bot -D bot && echo 'bot:0' | chpasswd && passwd -u bot
RUN echo 'bot     ALL=(ALL:ALL) ALL' >> /etc/sudoers
RUN echo "bot ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Expose
EXPOSE 4200

# Start
CMD ["/usr/bin/shellinaboxd", "-t", "-s", "/:LOGIN"]
