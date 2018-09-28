# Technology stack #

This demonstration was performed with these tools. Newer versions may exist.

- VirtualBox 5.8
- Minikube 0.25.2 (with Kubernetes 1.9.4)
- Kubectl 1.10.0
- Helm 2.8.2
- Prometheus Operator
- Kube-Prometheus (Alertmanager + Grafana)
- Python
- See jenkins-value.yaml file for Jenkins version and its plugins

### Presentation short instructions

| Step                       | Command
|----------------------------|---------
| Fresh Minikube             | `minikube delete`
| Initialize                 | `./start.sh`
| CLI env                    | `. ./env.sh`
| Monitoring stack           | curl https://raw.githubusercontent.com/javajon/monitoring-kubernetes/master/configurations/deploy-prometheus-stack.sh | bash -s
| Deploy Jenkins             | `helm install stable/jenkins --namespace jenkins --name jenkins -f ./jenkins-values.yaml`
| Add Quay secret            | `kubectl -n jenkins create -f quay-secret.yaml`

