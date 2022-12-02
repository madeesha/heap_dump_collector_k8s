FROM ubuntu

RUN apt-get update && apt-get install -y cron && apt install -y zip && apt install -y curl

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install

COPY /scripts/s3upload.sh /scripts/s3upload.sh
RUN chmod +x /scripts/s3upload.sh

COPY /scripts/s3sync-cron /etc/cron.d/s3sync-cron
RUN chmod 644 /etc/cron.d/s3sync-cron

RUN crontab /etc/cron.d/s3sync-cron

RUN touch /var/log/cron.log

CMD cron && tail -f /var/log/cron.log