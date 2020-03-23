As you play the game look back at this watch to see how Kubernetes is resisting the chaos of the dying alien pods.

`watch kubectl get deployments --label app-purpose=chaos`{{execute}}

Once complete use this ```clear```{{execute interrupt}} to break out of the watch or press <kbd>Ctrl</kbd>+<kbd>C</kbd>.
