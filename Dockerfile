FROM mongo:6.0.15

COPY rs-init.sh /etc/mongo/rs-init.sh

RUN mkdir -p /etc/mongo \
    && openssl rand -base64 756 >> /etc/mongo/keyfile \
    && chmod 400 /etc/mongo/keyfile \
    && chown mongodb:mongodb /etc/mongo/keyfile \
    && chmod +x /etc/mongo/rs-init.sh

CMD bash -c "/etc/mongo/rs-init.sh & docker-entrypoint.sh mongod --replSet mongoRS --keyFile /etc/mongo/keyfile --bind_ip_all --auth"

