`kubectl create namespace kubeinvaders`{{execute}}

`git clone https://github.com/lucky-sideburn/KubeInvaders && cd KubeInvaders`{{execute}}

`helm repo add kubeinvaders https://github.com/lucky-sideburn/KubeInvaders/`{{execute}}

`helm install kubeinvaders kubeinvaders/kubeinvaders --version 0.1.1 --namespace kubeinvaders --set service.type=NodePort --set ingress.enabled=false --set target_namespace="default\,more-apps" --set route_host=2886795284-30016-elsy06.environments.katacoda.com`{{execute}}

`kubectl patch service kubeinvaders -n kubeinvaders --type='json' --patch='[{"op": "replace", "path": "/spec/ports/0/nodePort", "value":30016}]'`{{execute}}
