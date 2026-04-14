#!/bin/bash

DB_HOST="database-1.c9i06ws48yte.ap-south-1.rds.amazonaws.com"
DB_PORT="3306"
DB_NAME="database-1"
DB_USER="admin"
DB_PASS="admin12345"

echo "Creating DB configuration for WAR..."

cat <<EOF > db-config.properties
spring.datasource.url=jdbc:mysql://$DB_HOST:$DB_PORT/$DB_NAME
spring.datasource.username=$DB_USER
spring.datasource.password=$DB_PASS
spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver
EOF

echo "DB config file created: db-config.properties"
