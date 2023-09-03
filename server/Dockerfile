FROM node:18

WORKDIR /app

COPY package*.json ./
RUN rm -rf node_modules
RUN npm install -g npm@10.0.0
RUN npm install

COPY . .

EXPOSE 5000

CMD ["node", "index.js"]

