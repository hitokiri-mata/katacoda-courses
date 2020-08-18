With the controller complete, try creating a new resource and watch how the `at` function works. First, clear the previous `At` resource for clarity and to verify the controller will correctly clean up your pods.

Delete the old `At` resource:

`kubectl delete at at-sample`{{execute}}

Verify the resources and Pods are gone:

`kubectl get ats,pods`{{execute}}

Create another custom resource with a better schedule. Click `example/at-sample-two.yaml`{{open}} to open it in the editor. It will be blank. As before, add the following declaration to the opened YAML file in the editor:

```yaml
apiVersion: cnat.my.domain/v1alpha1
kind: At
metadata:
  name: at-sample-two
spec:
  schedule: "paste date string here"
  command: 'echo "Happiness is when what you think, what you say, and what you do are in harmony."'
```{{copy}}

Click the Copy to Clipboard icon that follows the text to and paste it into the editor. For the declared schedule time, add a server time that will be one to two minutes from now:

`date -d "$(date --utc +%FT%TZ) + 2 min" +%FT%TZ`{{execute}}

Copy the date and paste it into the YAML file and **immediately** submit this resource declaration to Kubernetes:

`kubectl apply -f at-sample-two.yaml`{{execute}}

The new `At` is now listed:

`kubectl get ats,pods`{{execute}}

Watch for the new Pod to be created by your `At` controller in a minute or so:

`watch kubectl get pods`{{execute}}

When the Pod appears, that means the schedule has triggered. Use this `clear`{{execute interrupt}} to break out of the watch or press <kbd>Ctrl</kbd>+<kbd>C</kbd>.

Check the events in the resource:

`kubectl describe at at-sample-two`{{execute}}

If this works for you, congratulations!
