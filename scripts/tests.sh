#/bin/bash

# wait for services to load...
sleep 10

# test frontend
curl -f http://localhost:8080 || exit 1

# test backend
curl -f http://localhost:3000 || exit 1

# test db
docker exec db mysql -h db -u root -p$DB_PASSWORD -e "SHOW DATABASES;" || exit 1