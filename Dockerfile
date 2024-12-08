FROM node:22.11.0-alpine as builder

WORKDIR '/sample_app_prod'

COPY package*.json .

RUN npm install

COPY . .

CMD ["npm", "run", "build"]

FROM nginx

WORKDIR '/sample_app_prod'
EXPOSE 80
COPY --from=builder ./sample_app_prod/build /usr/share/nginx/html
