Once available, you can exercise the service two ways. First, simply from the command line,

`curl https://[[HOST_SUBDOMAIN]]-31112-[[KATACODA_HOST]].environments.katacoda.com`{{execute}}

You can also watch the sidecar continuously updating the Nginx static web page with its timestamp.

`while true; do sleep 1; curl -s https://2886795289-31111-elsy04.environments.katacoda.com/ | tail -2; done;`{{execute}}

Use this ```clear```{{execute interrupt}} to break out of the watch or press <kbd>Ctrl</kbd>+<kbd>C</kbd>.

The same Nginx output from the `sidecar-pod` can also be seen in your browser from the "sidecar-pod" tab above the command line area or from this link: https://[[HOST_SUBDOMAIN]]-31111-[[KATACODA_HOST]].environments.katacoda.com

As an alternative to the kubectl CLI you can also observe the pod logs in the [Kubernetes Dashboard](https://[[HOST_SUBDOMAIN]]-30000-[[KATACODA_HOST]].environments.katacoda.com/) by clicking on the tab above this command line or from this link: https://[[HOST_SUBDOMAIN]]-30000-[[KATACODA_HOST]].environments.katacoda.com