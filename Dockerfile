# Base image
FROM node:latest

# Create app directory
RUN mkdir -p /app
WORKDIR /app

COPY package*.json ./
RUN yarn install

# Bundle app source
COPY . /app

# Build app
RUN yarn build

RUN npm install -g pm2

EXPOSE 3000

CMD ["pm2-runtime", "server.js"]
