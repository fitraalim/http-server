FROM node:14.17.6-alpine3.12

RUN npm install -g http-server

RUN mkdir /public
WORKDIR /public

EXPOSE 80
CMD ["http-server -p 80"]
