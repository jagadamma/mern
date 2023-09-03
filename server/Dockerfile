FROM node:14
RUN mkdir app

WORKDIR /app

COPY package*.json ./

RUN npm i
RUN npm run start
COPY . .

EXPOSE 5000

CMD ["node", "index.js"]

