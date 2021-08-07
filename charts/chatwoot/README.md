 # Chatwoot

Customer engagement suite, an open-source alternative to Intercom, Zendesk, Salesforce Service Cloud etc. 🔥💬

## TL;DR

```
helm repo add chatwoot https://chatwoot.github.io/charts
helm install chatwoot chatwoot/chatwoot
```

## Prerequistes

- Kubernetes 1.16+
- Helm 3.1.0+
- PV provisioner support in the underlying infrastructure


## Installing the chart

To install the chart with the release name `chatwoot`:

```console
$ helm install chatwoot chatwoot/chatwoot
```

The command deploys Chatwoot on the Kubernetes cluster in the default configuration. The [Parameters](#parameters) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the chart

To uninstall/delete the `chatwoot` deployment:

```console
helm delete chatwoot
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

> **Note**: Persistent volumes are not deleted automatically. They need to removed manually.


## Parameters


### Chatwoot Image parameters

| Name                | Description                                          | Value                 |
| ------------------- | ---------------------------------------------------- | --------------------- |
| `image.repository`  | Chatwoot image repository                           | `chatwoot/chatwoot`    |
| `image.tag`         | Chatwoot image tag (immutable tags are recommended) | `v18.1.1`              |
| `image.pullPolicy`  | Chatwoot image pull policy                          | `IfNotPresent`         |
