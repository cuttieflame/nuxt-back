FROM node:14.16.1-alpine AS build
RUN mkdir -p /usr/src/nuxt-app
WORKDIR /usr/src/nuxt-app

RUN apk update && apk upgrade

COPY package*.json ./

COPY . /usr/src/nuxt-app/
RUN npm install

EXPOSE 3000
ENV NUXT_HOST=0.0.0.0
ENV NUXT_PORT=3000

# start the app
CMD [ "npm", "run","dev" ]
