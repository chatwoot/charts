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


### Chatwoot Environment Variables

| Name                              | Description                                          | Value                                              |
| --------------------------------- | ---------------------------------------------------- | -------------------------------------------------- |
| env.ACTIVE_STORAGE_SERVICE        | string                                               | `"local"`                                          |
| env.ASSET_CDN_HOST                | string                                               | `""`                                               |
| env.AWS_ACCESS_KEY_ID             | string                                               | `""`                                               |
| env.AWS_ENDPOINT_URL              | string                                               | `""`                                               |  |
| env.AWS_REGION                    | string                                               | `""`                                               |  |
| env.AWS_SECRET_ACCESS_KEY         | string                                               | `""`                                               |  |
| env.CHATWOOT_INSTALLATION_ENV     | string                                               | `"helm"`                                           |  |
| env.ENABLE_ACCOUNT_SIGNUP         | string                                               | `"false"`                                          |  |
| env.FB_APP_ID                     | string                                               | `""`                                               |  |
| env.FB_APP_SECRET                 | string                                               | `""`                                               |  |
| env.FB_VERIFY_TOKEN               | string                                               | `""`                                               |  |
| env.FORCE_SSL                     | string                                               | `"false"`                                          |  |
| env.FRONTEND_URL                  | string                                               | `"http://0.0.0.0:3000/"` |  |
| env.IOS_APP_ID                    | string                                               | `"6C953F3RX2.com.chatwoot.app"` |  |
| env.LOG_LEVEL                     | string                                               | `"info"` |  |
| env.LOG_SIZE                      | string                                               | `"500"` |  |
| env.MAILER_INBOUND_EMAIL_DOMAIN   | string                                               | `""` |  |
| env.MAILER_SENDER_EMAIL           | string                                               | `""` |  |
| env.MAILGUN_INGRESS_SIGNING_KEY   | string                                               | `""` |  |
| env.MANDRILL_INGRESS_API_KEY      | string                                               | `""` |  |
| env.POSTGRES_DB                   | string                                               | `"chatwoot_production"` |  |
| env.POSTGRES_HOST                 | string                                               | `"chatwoot-chatwoot-postgresql"` |  |
| env.POSTGRES_PASSWORD             | string                                               | `"postgres"` |  |
| env.POSTGRES_PORT                 | int                                                  | `5432` |  |
| env.POSTGRES_USERNAME             | string                                               | `"postgres"` |  |
| env.RAILS_ENV                     | string                                               | `"production"` |  |
| env.RAILS_INBOUND_EMAIL_PASSWORD  | string                                               | `""` |  |
| env.RAILS_INBOUND_EMAIL_SERVICE   | string                                               | `""` |  |
| env.RAILS_LOG_TO_STDOUT           | string                                               | `"true"` |  |
| env.RAILS_MAX_THREADS             | string                                               | `"5"` |  |
| env.REDIS_HOST                    | string                                               | `"chatwoot-chatwoot-redis-master"` |  |
| env.REDIS_PASSWORD                | string                                               | `"redis"` |  |
| env.REDIS_SENTINELS               | string                                               | `""` |  |
| env.REDIS_SENTINEL_MASTER_NAME    | string                                               | `""` |  |
| env.REDIS_URL                     | string                                               | `"redis://:redis@chatwoot-chatwoot-redis-master:6379"` |  |
| env.S3_BUCKET_NAME                | string                                               | `""` |  |
| env.SECRET_KEY_BASE               | string                                               | `"wsedrfghjhygtfrdecfvbhnygtfvbtyftctdrxresxcygvujhb"` |  |
| env.SENTRY_DSN                    | string                                               | `""` |  |
| env.SLACK_CLIENT_ID               | string                                               | `""` |  |
| env.SLACK_CLIENT_SECRET           | string                                               | `""` |  |
| env.SMTP_ADDRESS                  | string                                               | `""` |  |
| env.SMTP_AUTHENTICATION           | string                                               | `"plain"` |  |
| env.SMTP_ENABLE_STARTTLS_AUTO     | string                                               | `"true"` |  |
| env.SMTP_OPENSSL_VERIFY_MODE      | string                                               | `"no     ne"` |  |
| env.SMTP_PASSWORD                 | string                                               | `""` |  |
| env.SMTP_PORT                     | string                                               | `"587"` |  |
| env.SMTP_USERNAME                 | string                                               | `""` |  |
| env.TWITTER_APP_ID                | string                                               | `""` |  |
| env.TWITTER_CONSUMER_KEY          | string                                               | `""` |  |
| env.TWITTER_CONSUMER_SECRET       | string                                               | `""` |  |
| env.TWITTER_ENVIRONMENT           | string                                               | `""` |  |
| env.USE_INBOX_AVATAR_FOR_BOT      | string                                               | `"true"` |  |
                                            


## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `100` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| fullnameOverride | string | `""` |  |
| hooks.affinity | object | `{}` |  |
| hooks.migrate.env | list | `[]` |  |
| hooks.migrate.hookAnnotation | string | `"post-install,post-upgrade"` |  |
| hooks.migrate.resources.limits.memory | string | `"1000Mi"` |  |
| hooks.migrate.resources.requests.memory | string | `"1000Mi"` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"chatwoot/chatwoot"` |  |
| image.tag | string | `"v1.18.2"` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `""` |  |
| ingress.hosts[0].paths[0].backend.service.name | string | `"chatwoot"` |  |
| ingress.hosts[0].paths[0].backend.service.port.number | int | `3000` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| ingress.tls | list | `[]` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| postgresql.enabled | bool | `true` |  |
| postgresql.nameOverride | string | `"chatwoot-postgresql"` |  |
| postgresql.postgresqlDatabase | string | `"chatwoot_production"` |  |
| postgresql.postgresqlPassword | string | `"postgres"` |  |
| postgresql.postgresqlUsername | string | `"postgres"` |  |
| redis.auth.password | string | `"redis"` |  |
| redis.enabled | bool | `true` |  |
| redis.master.persistence.enabled | bool | `true` |  |
| redis.nameOverride | string | `"chatwoot-redis"` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.port | int | `80` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| services.annotations | object | `{}` |  |
| services.internlPort | int | `3000` |  |
| services.name | string | `"chatwoot"` |  |
| services.targetPort | int | `3000` |  |
| services.type | string | `"LoadBalancer"` |  |
| tolerations | list | `[]` |  |
| web.replica | int | `1` |  |
| worker.replica | int | `1` |  |

## Postgres

## Redis

## Upgrade
