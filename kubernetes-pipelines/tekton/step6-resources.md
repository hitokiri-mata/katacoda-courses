Pipeline Resources are entities that define the locations for inputs ingested and outputs produced by the steps in Tasks.

<img align="right" src="/javajon/courses/kubernetes-pipelines/tekton/assets/git.jpg" width="150">

For our pipeline we have defined the Git repo where the application source code resides.

`cat pipeline/git-resource.yaml`{{execute}}

Apply this PipelineResource declaration.

`kubectl apply -f pipeline/git-resource.yaml`{{execute}}

Verify the Resource has been declared.

`tkn resources list`{{execute}}
