
{{- define "new.deployment" }}
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{ .name }}
  labels:
    {{- include "new.labels" . | nindent 4 }}
spec:
  replicas: 1
  selector:
    matchLabels:
      {{- include "new.selectorLabels" . | nindent 6 }}
  template:
    metadata:
      labels:
        {{- include "new.labels" . | nindent 8 }}
    spec:
      serviceAccountName: {{ .serviceAccountName | quote }}
      containers:
        {{- include "new.pod.containers" . | nindent 8 }}
{{- end }}


{{- define "new.service" }}
---
apiVersion: v1
kind: Service
metadata:
  name: {{ .name }}
  labels:
    {{- include "new.labels" . | nindent 4 }}
spec:
  type: ClusterIP
  selector:
    {{- include "new.selectorLabels" . | nindent 4 }}
  ports:
    - port: {{ .config.port }}
      targetPort: {{ .config.port }}
{{- end }}
