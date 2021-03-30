FROM node:15.12.0-alpine3.10 as build
WORKDIR /app
COPY . .
RUN yarn install && yarn build
FROM nginx:latest
COPY --from=build /app/build /usr/share/nginx/html