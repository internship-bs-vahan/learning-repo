# Use Ubuntu 22.04 base image
FROM ubuntu:22.04

# Set working directory inside the container
WORKDIR /app
ENV DEBIAN_FRONTEND=noninteractive

# Install Apache, PHP, MySQL client, and common PHP extensions
RUN apt update -y && \
    apt install -y apache2 php libapache2-mod-php php-mysql php-mbstring php-curl mysql-client-core-8.0 && \
    apt clean

# Copy all project files
COPY . .

# Ensure setup.sh is executable and run it
RUN chmod +x setup.sh
RUN ./setup.sh

# Expose HTTP port
EXPOSE 80

# Start Apache in foreground
CMD ["apachectl", "-D", "FOREGROUND"]
