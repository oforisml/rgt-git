FROM node:8.11-alpine

WORKDIR /app

COPY package*.json ./
RUN npm i

COPY . .
COPY v.txt /

EXPOSE 5550
CMD [ "node", "index.js" ]
