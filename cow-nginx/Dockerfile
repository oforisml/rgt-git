FROM node:latest
WORKDIR /app
COPY . .
RUN chmod +x /app/src/entrypoint.sh
RUN mv /app/src/entrypoint.sh /usr/local/sbin
COPY v.txt .
WORKDIR /app/src
RUN npm install

ENTRYPOINT [ "entrypoint.sh" ]
