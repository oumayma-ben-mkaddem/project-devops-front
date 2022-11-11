# stage 1
FROM node:alpine AS my-app-devops
WORKDIR /app
COPY . .
RUN npm run build

# stage 2
FROM nginx:alpine
COPY --from=my-app-devops /app/dist/crudtuto-Front /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf