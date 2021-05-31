# Helm charts for chatwoot
(tested on Minikube)

First, enable nginx ingress on minikube cluster using this [link](https://kubernetes.io/docs/tasks/access-application-cluster/ingress-minikube/)

Start the minikube cluster using: minikube start

## To install helm chart
> helm install chart-name ./

## To access the application

> minikube service --url chatwoot-service
