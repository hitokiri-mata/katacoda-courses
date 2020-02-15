PipelineRuns are entities that declare the trigger to run a pipeline. The triggered pipeline is given specific contexts for inputs, outputs, and execution parameters.

For our PipelineRun we have define the Git repo where the application source code resides.

`cat pipeline/pipeline-run.yaml`{{execute}}

Notice the provided parameters and ServiceAccount which will be offered contexts to the tasks. Apply this PipelineResource declaration.

`kubectl apply -f pipeline/pipeline-run.yaml`{{execute}}

Verify the Resource has been declared.

`tkn pipelineruns list`{{execute}}

The pipeline is now running! 

`tkn pipelineruns describe application-pipeline-run`{{execute}}

Check the Registry from the tab above in a moment a new "app" container appear in the list.

Next, check the application.
