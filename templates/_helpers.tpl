{{/*
Expand the name of the chart.
*/}}
{{- define "chatwoot_helm.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "chatwoot_helm.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "chatwoot_helm.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "chatwoot_helm.labels" -}}
helm.sh/chart: {{ include "chatwoot_helm.chart" . }}
{{ include "chatwoot_helm.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "chatwoot_helm.selectorLabels" -}}
app.kubernetes.io/name: {{ include "chatwoot_helm.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "chatwoot_helm.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "chatwoot_helm.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Support containers for migrations
*/}}
{{- define "chatwoot_helm.waitForMigrations"}}
{{- $DATABASE_HOST :=  $.Values.env.POSTGRES_HOST }}
{{- $REDIS_HOST :=   $.Values.env.REDIS_HOST }}
- name: init-postgres
  image: busybox:1.28
  command: ["sh", "-c",  "until nslookup {{ $DATABASE_HOST }}; do echo waiting for {{ $DATABASE_HOST }}; sleep 2; done;"]
- name: init-redis
  image: busybox:1.28
  command: ["sh", "-c", "until nslookup {{ $REDIS_HOST }}; do echo waiting for {{ $REDIS_HOST }}; sleep 2; done;"]
- name: init-migrations
  env:
  - name: FRONTEND_URL
    valueFrom:
      configMapKeyRef:
        key: FRONTEND_URL
        name: env
  - name: POSTGRES_HOST
    valueFrom:
      configMapKeyRef:
        key: POSTGRES_HOST
        name: env
  - name: POSTGRES_PASSWORD
    valueFrom:
      configMapKeyRef:
        key: POSTGRES_PASSWORD
        name: env
  - name: POSTGRES_USERNAME
    valueFrom:
      configMapKeyRef:
        key: POSTGRES_USERNAME
        name: env
  - name: POSTGRES_PORT
    valueFrom:
      configMapKeyRef:
        key: POSTGRES_PORT
        name: env
  - name: RAILS_ENV
    valueFrom:
      configMapKeyRef:
        key: RAILS_ENV
        name: env
  - name: SECRET_KEY_BASE
    valueFrom:
      configMapKeyRef:
        key: SECRET_KEY_BASE
        name: env
  - name: REDIS_PASSWORD
    valueFrom:
      configMapKeyRef:
        key: REDIS_PASSWORD
        name: env
  - name: REDIS_SENTINEL_MASTER_NAME
    valueFrom:
      configMapKeyRef:
        key: REDIS_SENTINEL_MASTER_NAME
        name: env
  - name: REDIS_SENTINELS
    valueFrom:
      configMapKeyRef:
        key: REDIS_SENTINELS
        name: env
  - name: REDIS_URL
    valueFrom:
      configMapKeyRef:
        key: REDIS_URL
        name: env
  args: 
    - bundle
    - exec
    - rails
    - db:chatwoot_prepare
  image: "{{ .Values.deployment.image.dockerHub.chatwoot.owner }}/{{ .Values.deployment.image.dockerHub.chatwoot.repository }}:{{ .Values.deployment.image.dockerHub.chatwoot.tag }}"
{{- end }}


{{- define "postgres.labels" }}
{{- include "chatwoot_helm.labels" . }}
component: database
name: {{ .Values.applicationArch.storage.db.name }}
version: {{ .Values.applicationArch.storage.db.version | quote }}
{{- end }}


{{- define "redis.labels" }}
{{- include "chatwoot_helm.labels" . }}
component: dataStore
name: {{ .Values.applicationArch.storage.dataStore.name}}
version: {{ .Values.applicationArch.storage.dataStore.version}}
{{- end }}


{{- define "rails.labels" }}
{{- include "chatwoot_helm.labels" . }}
component: rails
name: {{ .Values.applicationArch.rails.name}}
version: {{ .Values.applicationArch.rails.version}}
{{- end }}


{{- define "sidekiq.labels" }}
{{- include "chatwoot_helm.labels" . }}
component: rails
name: {{ .Values.applicationArch.backgroundProc.name}}
version: {{ .Values.applicationArch.backgroundProc.version}}
{{- end }}
