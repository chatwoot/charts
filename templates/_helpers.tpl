{{/*
Expand the name of the chart.
*/}}
{{- define "chatwoot.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "chatwoot.fullname" -}}
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
{{- define "chatwoot.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "chatwoot.labels" -}}
helm.sh/chart: {{ include "chatwoot.chart" . }}
{{ include "chatwoot.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "chatwoot.selectorLabels" -}}
app.kubernetes.io/name: {{ include "chatwoot.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "chatwoot.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "chatwoot.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}


{{- define "postgres.labels" }}
{{- include "chatwoot.labels" . }}
component: database
name: {{ .Values.applicationArch.storage.db.name }}
version: {{ .Values.applicationArch.storage.db.version | quote }}
{{- end }}


{{- define "redis.labels" }}
{{- include "chatwoot.labels" . }}
component: dataStore
name: {{ .Values.applicationArch.storage.dataStore.name}}
version: {{ .Values.applicationArch.storage.dataStore.version}}
{{- end }}


{{- define "rails.labels" }}
{{- include "chatwoot.labels" . }}
component: rails
name: {{ .Values.applicationArch.rails.name}}
version: {{ .Values.applicationArch.rails.version}}
{{- end }}

{{- define "sidekiq.labels" }}
{{- include "chatwoot.labels" . }}
component: rails
name: {{ .Values.applicationArch.backgroundProc.name}}
version: {{ .Values.applicationArch.backgroundProc.version}}
{{- end }}

{{- define "migration-job.labels" }}
{{- include "chatwoot.labels" . }}
component: db-migration
name: db-migration
version: {{ .Values.applicationArch.rails.version}}
chart: "{{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}"
release: "{{ .Release.Name }}"
{{- end }}
