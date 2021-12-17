FROM ubuntu:latest

ARG TRACEROUTE_HOST=google.com
RUN echo ${TRACEROUTE_HOST} >> /root/TRACEROUTE_HOST

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

RUN apt-get update && apt-get install -y \
        cron traceroute

# Add crontab file in the cron directory
ADD crontab /etc/cron.d/hello-cron

ADD traceroute.sh /root/traceroute.sh

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/hello-cron

# Run the command on container startup
CMD cron && tail -f /var/log/cron.log
