In this step you will create an Operator using the KUDO CLI to generate the KUDO operator structure.

## Create Operator Structure

### Create Folder

Create a directory for the project.

`mkdir first-operator && cd first-operator`{{execure}}

Use the `package new` command to generator the source code skeleton.

`kubectl kudo package new first-operator`{{execute}}

This creates the main structure of the Operator that can be viewed using the tree command.

`tree`{{execute}}

<div class="info">
  <p><strong>Additionally</strong> If you added the -i flag with `package new` command you would be prompted for each operator detail.</p>
</div>

### Add a Maintainer

`kubectl kudo package add maintainer "your name" your@email.com`{{execute}}

### Add a Task

`kubectl kudo package add task`{{execute}}

This command uses an interactive prompt to construct the details of the task. Here is an example interaction:

```bash
$ kubectl kudo package add task
Task Name: app
✔ Apply
Task Resource: deployment
✗ Add another Resource:
```

### Add a Plan

`kubectl kudo package add plan`{{execute}}

This command uses an interactive prompt to construct the details of the plan. Here is an example interaction:

```bash
$ kubectl kudo package add plan
✔ Plan Name: deploy
✔ serial
Phase 1 name: main
✔ parallel
Step 1 name: everything
✔ app
✗ Add another Task:
✗ Add another Step:
✗ Add another Phase:
```

### Add a Parameter

`kubectl kudo package add parameter`{{execute}}

This command uses an interactive prompt to construct the details of the parameter. Here is an example interaction:

```
$ kubectl kudo package add parameter
Parameter Name: replicas
Default Value: 2
Display Name:
Description: Number of replicas that should be run as part of the deployment
✔ false
✗ Add Trigger Plan:
```

These above add commands have created the entirety of the first-operator with the exception of the details in the template/deployment.yaml file. To complete this operator execute the following:

```bash
cat << EOF > operator/templates/deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
spec:
  selector:
    matchLabels:
      app: nginx
  replicas: {{ .Params.replicas }}
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
        - name: nginx
          image: nginx:1.7.9
          ports:
            - containerPort: 80
EOF```{execute}
