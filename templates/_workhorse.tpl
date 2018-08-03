{{/* ######### gitlab-workhorse related templates */}}

{{/*
Return the gitlab-workhorse secret
*/}}
{{- define "gitlab.gitlab-workhorse.secret" -}}
{{- default (printf "%s-gitlab-workhorse-secret" .Release.Name) .Values.global.workhorse.secret | quote -}}
{{- end -}}


