# Everything below this line is referred to as "builder"
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
# For elastic beanstalk
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html