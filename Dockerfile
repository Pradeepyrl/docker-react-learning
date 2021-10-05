FROM node:alpine as build

WORKDIR /app

COPY package.json .
RUN npm config set registry http://registry.npmjs.org/ 
RUN npm install

COPY . .
RUN npm run build

FROM nginx:alpine

COPY --from=build /app/build /usr/share/nginx/html