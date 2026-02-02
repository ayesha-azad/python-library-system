#!/bin/bash
# Helper script to initialize MySQL database if tables don't exist

echo "Checking if database needs initialization..."

TABLES=$(docker exec mysql_lms mysql -uroot -proot -e "SHOW TABLES FROM lms;" 2>/dev/null | wc -l)

if [ "$TABLES" -le "1" ]; then
    echo "Database is empty. Initializing with lms.sql..."
    docker exec -i mysql_lms mysql -uroot -proot lms < db/lms.sql
    echo "Database initialized successfully!"
else
    echo "Database already has tables. Skipping initialization."
fi
