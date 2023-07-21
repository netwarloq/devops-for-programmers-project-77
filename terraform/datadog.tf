resource "datadog_monitor" "healthcheck_monitor" {
  name         = "Servers healthcheck"
  type         = "service check"
  query        = "\"http.can_connect\".over(\"*\").by(\"*\").last(4).count_by_status()"
  message      = ""
  include_tags = false

  monitor_thresholds {
    warning  = 2
    critical = 4
    ok       = 1
  }
}
