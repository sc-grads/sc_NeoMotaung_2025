FROM node:18

ENV MONGODB_CONNECTION_PROTOCOL mongodb
ENV MONGODB_DB_NAME gha-demo1
ENV MONGODB_CLUSTER_ADDRESS cluster0.bv4uj.mongodb.net/
ENV MONGODB_USERNAME neomot
ENV MONGODB_PASSWORD q3wggzxadAxTERqt

WORKDIR /app

COPY package*.json.

RUN npm install

COPY . .

CMD ["npm", "start"]