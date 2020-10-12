FROM postgres

ENV POSTGRES_PASSWORD=${DB_PASSWORD}
ENV POSTGRES_USER=${DB_USER}
ENV POSTGRES_DB=${DB_NAME}

RUN mkdir /prod
RUN CGO_ENABLED=0
RUN GOOS=linux
RUN go build -o typer-site /prod
RUN mkdir /prod/static
RUN cp backend/types.json /prod
RUN cp -r frontend/build/* /prod/static
EXPOSE 8443
RUN printf "DB_HOST=$DB_HOST\nDB_NAME=$DB_NAME\nDB_PASSWORD=$DB_PASSWORD\nDB_PORT=$DB_PORT\nDB_USER=$DB_USER" > /prod/.env
ENTRYPOINT [ "/prod/typer-site -prod -certFile=/certs/fullchain.pem -keyFile=/certs/privkey.pem -port=8443 -overwriteDb" ]