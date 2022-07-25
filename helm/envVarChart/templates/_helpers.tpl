{{/*
Expand the name of the chart.
*/}}
{{- define "envVarChart.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "envVarChart.selectorLabels" -}}
app: {{ include "envVarChart.name" . }}
{{- end }}

{{/*
Service labels
*/}}
{{- define "envVarChart.serviceLabels" -}}
name: {{- default (include "envVarChart.name" .) .Values.serviceNameExtension }}
{{ include "envVarChart.selectorLabels" . }}
{{- end }}