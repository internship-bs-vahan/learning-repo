#!/usr/bin/env bash

# This script installs dependencies and runs the project
# Run this with root user on Linux Machines(Rocky Linux)

echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Start apache
service apache2 start
service apache2 enable

# Replace 'hostname', 'username', and 'password' with the actual RDS credentials.
mysql -h bluebird-db.cb2am6iowxq9.eu-central-1.rds.amazonaws.com -P 3306 -u bluebird_user -p'password' < ./bluebirdhotel.sql


# Copy project to /var/www/html
rm -r /var/www/html/index.html
cp -r ./ /var/www/html/

# restart apache
service apache2 start

echo "View project at: http://localhost:80/"
