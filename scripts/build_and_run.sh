#/bin/bash

docker network create frontend_net
docker network create backend_net

docker build -t frontend ./frontend/. 
docker build -t backend  ./backend/. 
docker build -t db ./db/.

docker run -d --name frontend -p 8080:80 --network frontend_net frontend
docker run -d --name backend -p 3000:3000 -e DB_HOST=db -e DB_PORT=3306 -e DB_USER=root -e DB_PASSWORD=$DB_PASSWORD -e DB_NAME=mydatabase --network frontend_net --network backend_net backend
docker run -d --name db -e MYSQL_ROOT_PASSWORD=$DB_PASSWORD -e MYSQL_DATABASE=mydatabase --network backend_net db