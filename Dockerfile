FROM alpine:3.15
RUN apk upgrade --no-cache && \
    apk add --no-cache postfix postfix-mysql tzdata
RUN echo "maillog_file = /dev/stdout" >> /etc/postfix/main.cf

# apparantly, "the postfix command is reserved for the superuser"
USER root:root
EXPOSE 25/tcp 465/tcp 587/tcp 10025/tcp
VOLUME /var/spool/postfix /var/lib/postfix

CMD ["/usr/sbin/postfix", "start-fg"]
HEALTHCHECK CMD ["/usr/sbin/postfix", "status"]
