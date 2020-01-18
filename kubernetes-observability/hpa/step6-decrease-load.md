Stop the load testing requests and observe how the HPA reacts by scaling down the Pod count. This will save you money.

Go back _Terminal 2_ from the Tab above and break out of the loop.

Once complete use this ```clear```{{execute interrupt T2}} to break out of the watch or press <kbd>Ctrl</kbd>+<kbd>C</kbd>.

Go back to _Terminal 1_ and notice the Pods shutting down.

`watch kubectl get deployments,pods,services`{{execute T1}}

Once complete use this ```clear```{{execute interrupt T1}} to break out of the watch or press <kbd>Ctrl</kbd>+<kbd>C</kbd>.
