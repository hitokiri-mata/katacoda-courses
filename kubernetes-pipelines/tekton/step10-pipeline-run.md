PipelineRuns are entities that declare the trigger to run a pipeline. The triggered pipeline is given specific contexts for inputs, outputs, and execution parameters.

For our PipelineRun we have define the Git repo where the application source code resides.

`cat pipeline/pipeline-run.yaml`{{execute}}

Notice the provided contextual parameters and ServiceAccount which will be made available to the tasks. Apply this PipelineResource declaration.

`kubectl apply -f pipeline/pipeline-run.yaml`{{execute}}

Verify the Resource has been declared.

`tkn pipeline-runs list`{{execute}}

The pipeline is now running! Check the Registry from the tab above in a moment a new "app" container appear in the list.

Next, check the application.
