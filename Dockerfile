FROM node:22.11.0-alpine as builder

WORKDIR '/sample_app'

COPY package*.json .

RUN npm install

COPY . .

CMD ["npm", "run", "build"]

FROM nginx

WORKDIR '/sample_app_prod'
COPY --from=builder ./sample_app/build /usr/share/nginx/html
