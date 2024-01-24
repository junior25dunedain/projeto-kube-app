#!/bin/bash

echo "criando as imagens........"

docker build -t junior/projeto-back:1.0 backend/.
docker build -t junior/projeto-banco:1.0 database/.

echo "realizando o push das imagens........"
docker push junior/projeto-back:1.0
docker push junior/projeto-banco:1.0

echo "craindo os serviços no cluster kubernetes"

kubectl apply -f ./services.yaml

echo "criando os deployments"

kubectl apply -f ./deployment.yaml