FROM alpine:3.5

RUN apk add --update bash docker

COPY cleanup.sh /bin/cleanup.sh
RUN chmod +x /bin/cleanup.sh

CMD echo "$CRONTAB /bin/cleanup.sh" > /var/spool/cron/crontabs/root && crond -f
