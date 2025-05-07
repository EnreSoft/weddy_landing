FROM node:20 AS build
WORKDIR /app
COPY . .

FROM nginx:latest
COPY --from=build /app /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]