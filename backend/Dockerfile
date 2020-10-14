FROM postgres

ENV POSTGRES_PASSWORD=${DB_PASSWORD}
ENV POSTGRES_USER=${DB_USER}
ENV POSTGRES_DB=${DB_NAME}

RUN mkdir /prod
COPY typersite /prod
COPY types.json /prod
COPY .env /prod
RUN mkdir /prod/static
COPY static/* /prod/static/
EXPOSE 8443
# ENTRYPOINT [ "/prod/typersite", "-prod", "-certFile=/certs/fullchain.pem", "-keyFile=/certs/privkey.pem", "-port=8443", "-overwriteDb", "-dataFile=/prod/types.json" ]
ENTRYPOINT [ "/bin/sh" ]