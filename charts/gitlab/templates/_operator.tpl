{{/*
Return the version used of Gitlab
Defaults to using the information from the chart appVersion field, but can be
overridden using the global.gitlabVersion field in values.
*/}}
{{- define "gitlab.operator.gitlabVersion" -}}
{{- coalesce .Values.global.gitlabVersion .Chart.AppVersion -}}
{{- end -}}
