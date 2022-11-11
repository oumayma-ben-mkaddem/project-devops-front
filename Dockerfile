# stage 1
FROM node:alpine
WORKDIR /app
COPY . .
RUN npm ci && npm run build

# stage 2
FROM nginx:alpine
COPY /app/dist/crudtuto-Front /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf