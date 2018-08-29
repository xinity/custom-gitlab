{{/*
Return the version used of Gitlab
Defaults to using the information from the chart appVersion field, but can be
overridden using the global.gitlabVersion field in values.
*/}}
{{- define "gitlab.operator.gitlabVersion" -}}
{{- template "gitlab.operator.parseAppVersion" (coalesce .Values.global.gitlabVersion .Chart.AppVersion) -}}
{{- end -}}

{{/*
Returns a Gitlab version from the passed in app version or branchname

If the version is 'master' we use the 'latest' image tag.
Else if the version is a semver version, we use the 'x.x.x' semver notation.
Else we just use the version passed as the image tag
*/}}
{{- define "gitlab.operator.parseAppVersion" -}}
{{- $appVersion := coalesce . "master" -}}
{{- if eq $appVersion "master" -}}
latest
{{- else if regexMatch "^\\d+\\.\\d+\\.\\d+(-rc\\d+)?(-pre)?$" $appVersion -}}
{{- printf "%s" $appVersion -}}
{{- else -}}
{{- $appVersion -}}
{{- end -}}
{{- end -}}
