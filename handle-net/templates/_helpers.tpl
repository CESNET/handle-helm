{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "handle-net.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "handle-net.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "handle-net.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "handle-net.labels" -}}
app.kubernetes.io/release: "{{ .Release.Name }}"
app.kubernetes.io/heritage: "{{ .Release.Service }}"
helm.sh/chart: {{ include "handle-net.chart" . }}
{{ include "handle-net.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "handle-net.selectorLabels" -}}
app.kubernetes.io/name: {{ include "handle-net.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "handle-net.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "handle-net.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Get the certification secret name.
*/}}
{{- define "handle-net.secretCertificationName" -}}
    {{- if .Values.handle.existingCertificationSecret -}}
        {{- printf "%s" .Values.handle.existingCertificationSecret -}}
    {{- else -}}
        {{- printf "%s" (include "handle-net.fullname" .) -}}
    {{- end -}}
{{- end -}}

{{/*
Get the administrative secret name.
*/}}
{{- define "handle-net.secretAdmName" -}}
    {{- if .Values.handle.existingAdministrativeSecret -}}
        {{- printf "%s" .Values.handle.existingAdministrativeSecret -}}
    {{- else -}}
        {{- printf "%s" (include "handle-net.fullname" .) -}}
    {{- end -}}
{{- end -}}
