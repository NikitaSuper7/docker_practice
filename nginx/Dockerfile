# Используем официальный образ Nginx
FROM nginx:latest

# Копируем файл конфигурации Nginx в контейнер
COPY /nginx/nginx.conf /etc/nginx/nginx.conf
COPY /nginx/html/ /usr/share/nginx/html/

# Открываем порт 80 для HTTP-трафика
EXPOSE 80