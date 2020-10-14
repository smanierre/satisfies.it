FROM postgres

ENV POSTGRES_PASSWORD=${DB_PASSWORD}
ENV POSTGRES_USER=${DB_USER}
ENV POSTGRES_DB=${DB_NAME}

RUN mkdir /prod
COPY typersite /prod
COPY types.json /prod
RUN mkdir /prod/static
COPY static/* /prod/static/
EXPOSE 8443
RUN printf "DB_HOST=$DB_HOST\nDB_NAME=$DB_NAME\nDB_PASSWORD=$DB_PASSWORD\nDB_PORT=$DB_PORT\nDB_USER=$DB_USER" > /prod/.env
ENTRYPOINT [ "/prod/typer-site", "-prod", "-certFile=/certs/fullchain.pem", "-keyFile=/certs/privkey.pem", "-port=8443", "-overwriteDb" ]