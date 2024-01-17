# Use a base image
FROM alpine:19

# Install
RUN apk update && \
    apk add shellinabox && \
    apk add openrc
RUN echo 'root:root' | chpasswd

# Expose
EXPOSE 4200

# Start
CMD ["/usr/bin/shellinaboxd", "-t", "-s", "/:LOGIN"]
