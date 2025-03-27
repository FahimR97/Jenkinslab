FROM nginx:alpine
COPY app.py /app/
COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 80