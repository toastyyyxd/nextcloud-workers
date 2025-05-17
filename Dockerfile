FROM nextcloud:apache

RUN apt-get update && apt-get install -y \
    supervisor \
  && rm -rf /var/lib/apt/lists/* \
  && mkdir /var/log/supervisord /var/run/supervisord

WORKDIR /var/www/html

COPY supervisor.conf /

CMD ["supervisord", "-c", "/supervisord.conf"]
