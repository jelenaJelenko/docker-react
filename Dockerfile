FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#/app/build ce imati sve potrebno i izbuildano
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html