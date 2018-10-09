{{/*
Return the port to expose via Ingress/URLs

NOTE: All templates return _strings_, use as:
   {{ include "gitlab.shell.port" | int }}
*/}}
{{- define "gitlab.shell.port" -}}
{{- if .Values.global.shell.port -}}
{{-   if eq 0 (.Values.global.shell.port | int) -}}
{{-     printf "global.shell.port: '%s' is not an integer." .Values.global.shell.port | fail -}}
{{-   end -}}
{{- end -}}
{{ default 22 .Values.global.shell.port }}
{{- end -}}
