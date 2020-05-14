[Factor 11 of _The Twelve-Factor App_](https://12factor.net/logs) states all logs should be treated as event streams. The last thing you want in managing multiple applications where is one is routing and storing logs in custom and variant locations with inconsistent rules for persistence and rotation. This means your applications should never be concerned about the routing or storage of the logs. Your apps should simply output to a common stream. The standard streams for applications in containers are _stdout_ and _stderr_.







With distributed computing on Kubernetes this problem gets more 