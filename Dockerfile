FROM python:3.9-slim

# Install nginx
RUN apt-get update && apt-get install -y nginx

# Install Flask
RUN pip install flask

# Copy files
COPY app.py /app/
COPY nginx.conf /etc/nginx/nginx.conf

# Make app directory
WORKDIR /app

# Start script
COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 80

CMD ["/start.sh"]