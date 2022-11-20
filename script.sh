#!/bin/bash

echo "Creating Images"

docker build -t santeemarcel/projeto-backend:1.0 backend/.
docker build -t santeemarcel/projeto-database:1.0 database/.

echo "Pushing Images"

docker push santeemarcel/projeto-backend:1.0
docker push santeemarcel/projeto-database:1.0

echo "Creating service on kubernetes cluster"

kubectl apply -f ./services.yml

echo "Creating deployments"

kubectl apply -f ./deployments.yml
