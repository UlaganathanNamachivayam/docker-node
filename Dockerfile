FROM phusion/passenger-nodejs:latest
MAINTAINER Luciano Afranllie, listas.luafran@gmail.com

# Set correct environment variables.
ENV HOME /root

# Use baseimage-docker's init process.
CMD ["/sbin/my_init"]

#RUN /usr/sbin/enable_insecure_key
ADD publickey.ssh /tmp/publickey.ssh
RUN cat /tmp/publickey.ssh >> /root/.ssh/authorized_keys && rm -f /tmp/publickey.ssh

ADD nodeapp.conf /etc/nginx/sites-enabled/nodeapp.conf
RUN rm /etc/nginx/sites-enabled/default
ADD nodeapp /home/app/nodeapp
RUN rm -f /etc/service/nginx/down

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
