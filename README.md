# Chatwoot Helm Charts
[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/artifact-hub)](https://artifacthub.io/packages/helm/chatwoot/chatwoot)

This repository contains helm charts for [Chatwoot](https://github.com/chatwoot/chatwoot).

# Omnipurchase ingress installation
Ingress for the kubernetes cluster.
## Uninstall (``I haven't tested this yet``)
helm uninstall nginx-ingress -n ingress-nginx

## Install
helm install nginx-ingress ingress-nginx/ingress-nginx   --namespace ingress-nginx   -f nginx-ingress/values.yaml

## Upgrade
helm upgrade nginx-ingress ingress-nginx/ingress-nginx   --namespace ingress-nginx   -f nginx-ingress/values.yaml

# Omnipurchase Installation
``Uninstall and install will not affect existing data.``
- [Environmentals](https://www.notion.so/Omnipurchase-environmentals-185522133035802e9231df46279bafa8)
- change the postgres and redis passwords in the values.yaml file.
- Copy and replace the env: value into charts/chatwoot/values.yaml

## Uninstall
helm uninstall chatwoot -n default

## Install
cd charts/chatwoot
helm install chatwoot . -f values.yaml --wait --timeout 60m --debug

## Upgrade
helm upgrade chatwoot . -f values.yaml --wait --timeout 60m --debug

## Configuration
Check the [README.md](./charts/chatwoot/README.md)

## Questions? Feedback?
[Join our discord server.](https://discord.gg/cJXdrwS)
