#outputs logs
output "logs_path" {
  description = "Logs del cloudwatch"
  value       = var.logs_path
}

#cloudwatch logs 
output "log_group_name" {
  description = "Nombre del grupo"
  value       = aws_cloudwatch_log_group.log_group.name
}

output "log_group_retention_in_days" {
  description = "Número de eventos"
  value       = aws_cloudwatch_log_group.log_group.retention_in_days
}

output "log_group_arn" {
  description = "Log del grupo ARN"
  value       = aws_cloudwatch_log_group.log_group.arn
}

#log stream
output "log_stream_name" {
  description = "Nombre del log stream"
  value       = aws_cloudwatch_log_stream.log_stream.name
}

output "log_stream_log_group_name" {
  description = "Nombre del grupo del log stream
  value       = aws_cloudwatch_log_stream.log_stream.log_group_name
}

output "log_stream_arn" {
  description = "El ARN del log stream"
  value       = aws_cloudwatch_log_stream.log_stream.arn
}

