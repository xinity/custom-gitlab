{{/* ######### object storage related templates */}}

{{/*
Return the minio service endpoint
*/}}
{{- define "gitlab.minio.endpoint" -}}
{{- $name := default "minio-svc" .Values.minio.serviceName -}}
{{- $port := default 9000 .Values.minio.port | int -}}
{{- printf "http://%s-%s:%d" .Release.Name $name $port -}}
{{- end -}}

{{/*
Return the secret for lfs storage connection
*/}}
{{- define "gitlab.objectstorage.lfs.secret" -}}
{{- .Values.global.objectStorage.lfs.connection.secret -}}
{{- end -}}

{{/*
Return the key for lfs storage connection
*/}}
{{- define "gitlab.objectstorage.lfs.key" -}}
{{- coalesce .Values.global.objectStorage.lfs.connection.key "connection" -}}
{{- end -}}

{{/*
Return the key for lfs storage bucket
- This template presents an upgrade path from local->global
*/}}
{{- define "gitlab.objectstorage.lfs.bucket" -}}
{{- coalesce .Values.global.objectStorage.lfs.bucket .Values.lfs.bucket -}}
{{- end -}}

{{/*
Return the secret for artifacts storage connection
*/}}
{{- define "gitlab.objectstorage.artifacts.secret" -}}
{{- .Values.global.objectStorage.artifacts.connection.secret -}}
{{- end -}}

{{/*
Return the key for artifacts storage connection
*/}}
{{- define "gitlab.objectstorage.artifacts.key" -}}
{{- coalesce .Values.global.objectStorage.artifacts.connection.key "connection" -}}
{{- end -}}

{{/*
Return the key for artifacts storage bucket
- This template presents an upgrade path from local->global
*/}}
{{- define "gitlab.objectstorage.artifacts.bucket" -}}
{{- coalesce .Values.global.objectStorage.artifacts.bucket .Values.artifacts.bucket -}}
{{- end -}}

{{/*
Return the secret for uploads storage connection
*/}}
{{- define "gitlab.objectstorage.uploads.secret" -}}
{{- .Values.global.objectStorage.uploads.connection.secret -}}
{{- end -}}

{{/*
Return the key for uploads storage connection
*/}}
{{- define "gitlab.objectstorage.uploads.key" -}}
{{- coalesce .Values.global.objectStorage.uploads.connection.key "connection" -}}
{{- end -}}

{{/*
Return the key for uploads storage bucket
- This template presents an upgrade path from local->global
*/}}
{{- define "gitlab.objectstorage.uploads.bucket" -}}
{{- coalesce .Values.global.objectStorage.uploads.bucket .Values.uploads.bucket -}}
{{- end -}}
