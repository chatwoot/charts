{{- define "chatwoot.environ" }}

            - name: ACTIVE_STORAGE_SERVICE
              valueFrom:
                configMapKeyRef:
                  key: ACTIVE_STORAGE_SERVICE
                  name: env
            - name: ASSET_CDN_HOST
              valueFrom:
                configMapKeyRef:
                  key: ASSET_CDN_HOST
                  name: env
            - name: AWS_ACCESS_KEY_ID
              valueFrom:
                configMapKeyRef:
                  key: AWS_ACCESS_KEY_ID
                  name: env
            - name: AWS_REGION
              valueFrom:
                configMapKeyRef:
                  key: AWS_REGION
                  name: env
            - name: AWS_SECRET_ACCESS_KEY
              valueFrom:
                configMapKeyRef:
                  key: AWS_SECRET_ACCESS_KEY
                  name: env
            - name: DISABLE_DATABASE_ENVIRONMENT_CHECK
              value: "0"
            - name: ENABLE_ACCOUNT_SIGNUP
              valueFrom:
                configMapKeyRef:
                  key: ENABLE_ACCOUNT_SIGNUP
                  name: env
            - name: FB_APP_ID
              valueFrom:
                configMapKeyRef:
                  key: FB_APP_ID
                  name: env
            - name: FB_APP_SECRET
              valueFrom:
                configMapKeyRef:
                  key: FB_APP_SECRET
                  name: env
            - name: FB_VERIFY_TOKEN
              valueFrom:
                configMapKeyRef:
                  key: FB_VERIFY_TOKEN
                  name: env
            - name: FORCE_SSL
              valueFrom:
                configMapKeyRef:
                  key: FORCE_SSL
                  name: env
            - name: FRONTEND_URL
              valueFrom:
                configMapKeyRef:
                  key: FRONTEND_URL
                  name: env
            - name: IOS_APP_ID
              valueFrom:
                configMapKeyRef:
                  key: IOS_APP_ID
                  name: env
            - name: LOG_LEVEL
              valueFrom:
                configMapKeyRef:
                  key: LOG_LEVEL
                  name: env
            - name: LOG_SIZE
              valueFrom:
                configMapKeyRef:
                  key: LOG_SIZE
                  name: env
            - name: MAILER_INBOUND_EMAIL_DOMAIN
              valueFrom:
                configMapKeyRef:
                  key: MAILER_INBOUND_EMAIL_DOMAIN
                  name: env
            - name: MAILER_SENDER_EMAIL
              valueFrom:
                configMapKeyRef:
                  key: MAILER_SENDER_EMAIL
                  name: env
            - name: MAILGUN_INGRESS_SIGNING_KEY
              valueFrom:
                configMapKeyRef:
                  key: MAILGUN_INGRESS_SIGNING_KEY
                  name: env
            - name: MANDRILL_INGRESS_API_KEY
              valueFrom:
                configMapKeyRef:
                  key: MANDRILL_INGRESS_API_KEY
                  name: env
            - name: NODE_ENV
              value: production
            - name: POSTGRES_HOST
              valueFrom:
                configMapKeyRef:
                  key: POSTGRES_HOST
                  name: env
            - name: POSTGRES_PORT
              valueFrom:
                configMapKeyRef:
                  key: POSTGRES_PORT
                  name: env
            - name: POSTGRES_PASSWORD
              valueFrom:
                configMapKeyRef:
                  key: POSTGRES_PASSWORD
                  name: env
            - name: POSTGRES_DB
              valueFrom:
                configMapKeyRef:
                  key: POSTGRES_DB
                  name: env
            - name: POSTGRES_USERNAME
              valueFrom:
                configMapKeyRef:
                  key: POSTGRES_USERNAME
                  name: env
            - name: RAILS_ENV
              valueFrom:
                configMapKeyRef:
                  key: RAILS_ENV
                  name: env
            - name: RAILS_INBOUND_EMAIL_PASSWORD
              valueFrom:
                configMapKeyRef:
                  key: RAILS_INBOUND_EMAIL_PASSWORD
                  name: env
            - name: RAILS_INBOUND_EMAIL_SERVICE
              valueFrom:
                configMapKeyRef:
                  key: RAILS_INBOUND_EMAIL_SERVICE
                  name: env
            - name: RAILS_LOG_TO_STDOUT
              valueFrom:
                configMapKeyRef:
                  key: RAILS_LOG_TO_STDOUT
                  name: env
            - name: RAILS_MAX_THREADS
              valueFrom:
                configMapKeyRef:
                  key: RAILS_MAX_THREADS
                  name: env
            - name: REDIS_PASSWORD
              valueFrom:
                configMapKeyRef:
                  key: REDIS_PASSWORD
                  name: env
            - name: REDIS_SENTINELS
              valueFrom:
                configMapKeyRef:
                  key: REDIS_SENTINELS
                  name: env
            - name: REDIS_SENTINEL_MASTER_NAME
              valueFrom:
                configMapKeyRef:
                  key: REDIS_SENTINEL_MASTER_NAME
                  name: env
            - name: REDIS_URL
              valueFrom:
                configMapKeyRef:
                  key: REDIS_URL
                  name: env
            - name: S3_BUCKET_NAME
              valueFrom:
                configMapKeyRef:
                  key: S3_BUCKET_NAME
                  name: env
            - name: SECRET_KEY_BASE
              valueFrom:
                configMapKeyRef:
                  key: SECRET_KEY_BASE
                  name: env
            - name: SENTRY_DSN
              valueFrom:
                configMapKeyRef:
                  key: SENTRY_DSN
                  name: env
            - name: SLACK_CLIENT_ID
              valueFrom:
                configMapKeyRef:
                  key: SLACK_CLIENT_ID
                  name: env
            - name: SLACK_CLIENT_SECRET
              valueFrom:
                configMapKeyRef:
                  key: SLACK_CLIENT_SECRET
                  name: env
            - name: SMTP_ADDRESS
              valueFrom:
                configMapKeyRef:
                  key: SMTP_ADDRESS
                  name: env
            - name: SMTP_AUTHENTICATION
              valueFrom:
                configMapKeyRef:
                  key: SMTP_AUTHENTICATION
                  name: env
            - name: SMTP_ENABLE_STARTTLS_AUTO
              valueFrom:
                configMapKeyRef:
                  key: SMTP_ENABLE_STARTTLS_AUTO
                  name: env
            - name: SMTP_OPENSSL_VERIFY_MODE
              valueFrom:
                configMapKeyRef:
                  key: SMTP_OPENSSL_VERIFY_MODE
                  name: env
            - name: SMTP_PASSWORD
              valueFrom:
                configMapKeyRef:
                  key: SMTP_PASSWORD
                  name: env
            - name: SMTP_PORT
              valueFrom:
                configMapKeyRef:
                  key: SMTP_PORT
                  name: env
            - name: SMTP_USERNAME
              valueFrom:
                configMapKeyRef:
                  key: SMTP_USERNAME
                  name: env
            - name: TWITTER_APP_ID
              valueFrom:
                configMapKeyRef:
                  key: TWITTER_APP_ID
                  name: env
            - name: TWITTER_CONSUMER_KEY
              valueFrom:
                configMapKeyRef:
                  key: TWITTER_CONSUMER_KEY
                  name: env
            - name: TWITTER_CONSUMER_SECRET
              valueFrom:
                configMapKeyRef:
                  key: TWITTER_CONSUMER_SECRET
                  name: env
            - name: TWITTER_ENVIRONMENT
              valueFrom:
                configMapKeyRef:
                  key: TWITTER_ENVIRONMENT
                  name: env
            - name: USE_INBOX_AVATAR_FOR_BOT
              valueFrom:
                configMapKeyRef:
                  key: USE_INBOX_AVATAR_FOR_BOT
                  name: env

{{- end }}
