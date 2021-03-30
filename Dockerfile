FROM node:lts-alpine3.13 as build
RUN npm install -g create-react-app
WORKDIR /app
COPY . /app
RUN npm install && npm run build

FROM nginx:latest
COPY --from=build /app/build /usr/share/nginx/html