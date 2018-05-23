eval $(docker-machine env devlocal)
mvn clean package
docker rm -f microservice
docker build . -t microservice
docker run -d --name microservice -p 8085:8080 microservice
docker network connect apiconnectdockermaster_ibmnet  microservice