FROM alpine:3.21

LABEL org.opencontainers.image.authors="Simon Rupf <simon@rupf.net>" \
      org.opencontainers.image.source=https://github.com/simonrupf/docker-postfix \
      org.opencontainers.image.version="${VERSION}"

RUN apk upgrade --no-cache && \
    apk add --no-cache postfix postfix-mysql tzdata && \
    ( \
        echo "maillog_file = /dev/stdout" && \
        echo "smtpd_forbid_bare_newline = yes" && \
        echo "smtpd_forbid_unauth_pipelining = yes" \
    ) >> /etc/postfix/main.cf && \
    newaliases -oA/etc/postfix/aliases

# apparantly, "the postfix command is reserved for the superuser"
USER root:root
EXPOSE 25/tcp 465/tcp 587/tcp 10025/tcp
VOLUME /var/spool/postfix /var/lib/postfix

CMD ["/usr/sbin/postfix", "start-fg"]
HEALTHCHECK CMD ["/usr/sbin/postfix", "status"]
