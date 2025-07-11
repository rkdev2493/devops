locals {
  cloudwatch_agent_config = jsonencode({
    metrics = {
      append_dimensions = {
        InstanceId = "$${aws:InstanceId}"
      }
      metrics_collected = {
        CPU = {}
        Disk = {
          measurement = ["used_percent"]
          resources   = ["*"]
        }
        Mem = {
          measurement = ["mem_used_percent"]
        }
      }
    }
  })
}
