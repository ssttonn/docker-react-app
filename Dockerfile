FROM node:22.11.0-alpine as builder

WORKDIR '/sample_app_prod'

COPY package*.json .

RUN npm install

COPY . .

RUN npm run build

FROM nginx

EXPOSE 80

COPY --from=builder ./sample_app_prod/build /usr/share/nginx/html
