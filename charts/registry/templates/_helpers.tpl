{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Return the registry authEndpoint
Defaults to the globally set gitlabHostname if an authEndpoint hasn't been provided
to the chart
*/}}
{{- define "registry.authEndpoint" -}}
{{- if .Values.authEndpoint -}}
{{- .Values.authEndpoint -}}
{{- else -}}
{{- template "gitlabUrl" . -}}
{{- end -}}
{{- end -}}

{{- define "assembleHost" -}}
{{- if $.Values.global.hosts.domain -}}
{{-   $domainHost := printf ".%s" $.Values.global.hosts.domain -}}
{{-   if $.Values.global.hosts.hostSuffix -}}
{{-     $domainHost := printf "-%s%s" $.Values.global.hosts.hostSuffix $domainHost -}}
{{-   end -}}
{{-   $domainHost := printf "%s-%s" . $domainHost -}}
{{- end -}}
{{- $domainHost -}}
{{- end -}}

{{- define "gitlabHost" -}}
{{- coalesce .Values.gitlab.host .Values.global.hosts.gitlab.name (include "assembleHost" "gitlab") -}}
{{- end -}}

{{- define "gitlabUrl" -}}
{{- if or .Values.global.hosts.https .Values.global.hosts.gitlab.https -}}
{{-   $protocol := "https" -}}
{{- end -}}
{{- printf "%s://%s" (default "http" $protocol) (include "gitlabHost" .) -}}
{{- end -}}
