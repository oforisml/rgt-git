FROM node:12.18-alpine

#Directory of the application
WORKDIR /home/node/app

#Copying the depencies
COPY package*.json /home/node/app/


#Installing dependencies
RUN npm install

COPY entrypoint.sh /usr/local/bin

RUN chmod +x /usr/local/bin/entrypoint.sh

RUN source /usr/local/bin

COPY . /home/node/app

ENTRYPOINT [ "entrypoint.sh" ]
