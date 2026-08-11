FROM node:26.7-alpine AS build
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci
COPY . .
RUN npx expo export --platform web

FROM nginx:1.29-alpine
COPY --from=build /app/dist /usr/share/nginx/html
RUN sed -i 's/index  index.html index.htm;/index index.html;\n        try_files $uri $uri.html $uri\/ =404;/' /etc/nginx/conf.d/default.conf
EXPOSE 80
