FROM alpine:3.5

RUN apk add --update bash docker

COPY cleanup.sh /bin/clean-up.sh
RUN chmod +x /bin/clean-up.sh

CMD echo "$CRONTAB /bin/clean-up.sh" > /var/spool/cron/crontabs/root && crond -f
