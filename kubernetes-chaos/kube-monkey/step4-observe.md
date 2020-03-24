As Pod are killed, come back to the watch in the terminal and see how Kubernetes is repairing the Pods.

`watch kubectl get deployments,pods --all-namespaces -l app-purpose=chaos`{{execute}}

Once complete use this ```clear```{{execute interrupt}} to break out of the watch or press <kbd>Ctrl</kbd>+<kbd>C</kbd>.

