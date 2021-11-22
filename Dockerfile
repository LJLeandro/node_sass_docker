FROM node:10-alpine
# Update
RUN apk update
RUN apk add --update nodejs npm
RUN apk add g++ make python2
RUN apk add --virtual build-dependencies
# Cria a pasta da app
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
# Instala as dependencias da app
COPY package.json /usr/src/app/

RUN npm install
# RUN npm install --g --production windows-build-tools --add-python-to-path
RUN npm config set python /usr/bin/python
RUN npm install node-gyp
RUN npm install node-sass
# copia a app
COPY . /usr/src/app
EXPOSE 8080
CMD ["node", "/usr/src/app/server.js"]