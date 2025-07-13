locals {
  cloudwatch_agent_config = jsonencode({
    agent = {
      metrics_collection_interval = 60,
      run_as_user = "root"
    },
    metrics = {
      append_dimensions = {
        InstanceId = "$${aws:InstanceId}",
        ImageId = "$${aws:ImageId}",
        InstanceType = "$${aws:InstanceType}"
      },
      metrics_collected = {
        cpu = {
          measurement = [
            "cpu_usage_idle",
            "cpu_usage_iowait",
            "cpu_usage_user",
            "cpu_usage_system"
          ],
          metrics_collection_interval = 60,
          totalcpu = true
        },
        disk = {
          measurement = [
            "used_percent",
            "disk_free",
            "disk_used"
          ],
          metrics_collection_interval = 60,
          resources = ["*"]
        },
        mem = {
          measurement = [
            "mem_used_percent",
            "mem_available",
            "mem_total"
          ],
          metrics_collection_interval = 60
        }
      }
    }
  })
}
