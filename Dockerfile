FROM keymetrics/pm2:10-alpine

RUN apk update && apk upgrade && \
    apk add --no-cache bash git curl openssh

WORKDIR /usr/src/apps

COPY package*.json ./
RUN npm install

COPY . .

EXPOSE 3000

CMD ["pm2-runtime", "start", "pm2.json"]