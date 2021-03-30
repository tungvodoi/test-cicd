FROM node:15.12.0-alpine3.10 as build
WORKDIR /app
COPY . /app
RUN npm install && npm run build
FROM nginx:latest
COPY --from=build /app/build /usr/share/nginx/html