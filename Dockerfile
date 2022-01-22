FROM node:fermium-alpine3.12

RUN npm install -g http-server

RUN mkdir /public
WORKDIR /public
COPY ./index.html .

EXPOSE 8080
CMD ["http-server"]
