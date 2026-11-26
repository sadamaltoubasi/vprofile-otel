
{{- define "new.pod.containers" -}}
- name: {{ .name }}
  image: {{ .config.image | quote }}
  ports:
    - containerPort: {{ .config.port }}
  {{- with .config.env }}
  env:
    {{- range $key, $value := . }}
    - name: {{ $key }}
      value: {{ $value | quote }}
    {{- end }}
  {{- end }}
{{- end }}
