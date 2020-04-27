kubectl get pods -l app=random-logger

kubectl get pods -o=jsonpath="{.items[*]['metadata.name']}"

kubectl get pods -o=jsonpath="{.items[*]['metadata.name']}"

kubectl logs $POD_ONE -l app=random-logger

kubectl logs $(kubectl get pods -o=jsonpath="{.items[0]['metadata.name']}")
kubectl logs $(kubectl get pods -o=jsonpath="{.items[1]['metadata.name']}")
kubectl logs $(kubectl get pods -o=jsonpath="{.items[2]['metadata.name']}")


POD_ONE=$(kubectl get pods -l app=random-logger -o custom-columns=:metadata.name | grep random-logger | head -n 1)

kubectl logs $POD_ONE

kubectl logs -l app=random-logger

kubectl get pods -l app=random-logger -o custom-columns=:metadata.name
