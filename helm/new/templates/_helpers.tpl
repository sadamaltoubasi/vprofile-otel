{{/*
Selector labels used to identify component Pods.
*/}}
{{- define "new.selectorLabels" -}}
app.kubernetes.io/name: {{ .name | quote }}
{{- end }}


{{/*
Common labels applied to VProfile component resources.
*/}}
{{- define "new.labels" -}}
{{ include "new.selectorLabels" . }}
app.kubernetes.io/part-of: "vprofile"
{{- end }}

{{/*
Resolve the ServiceAccount name for VProfile components.
*/}}
{{- define "new.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
{{- default (printf "%s-vprofile" .Release.Name | trunc 63 | trimSuffix "-") .Values.serviceAccount.name -}}
{{- else -}}
{{- default "default" .Values.serviceAccount.name -}}
{{- end -}}
{{- end }}
