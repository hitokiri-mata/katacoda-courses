Because Tekton is a Kubenretes Operator, it's can be completly administered using the standard Kubenrtes manifests using the defined customer resources that have been associated with the Tekton controllers. You can use the kubectl tool as a way to manually manage these resources. For convenience, a command line tool called `tkn` can also manage these same Tekton resources. 

Install the optional `tkn` command line tool.

```bash
sudo apt update;sudo apt install -y gnupg && \
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3EFE0E0A2F2F60AA && \
echo "deb http://ppa.launchpad.net/tektoncd/cli/ubuntu eoan main"|sudo tee /etc/apt/sources.list.d/tektoncd-ubuntu-cli.list && \
sudo apt update && sudo apt install -y tektoncd-cli
```{{execute}}

More details on its various installation forms is in the [installation documentation](https://github.com/tektoncd/cli).

Verify the CLI tool is installed and can control the Tekton control plane.

`tkn version`{{execute}}

Like many command line tools you will also want to add the CLI autocompletion. As you type lengthy commands the tab key will make the best guess to fill in the command details.

`source <(tkn completion bash)`{{execute}}

With the `tnk` tool installed instead of running this,

`kubectl get pipelineresources`{{execute}}

you can run this,

`tkn resources list`{{execute}}

To see the resources you can manage use the CLI without any options

`tnk`{{execute}}

Each resource can be acted upon using the typical verbs `create`, `delete`, `describe`, `list`.

`tnk resources --help`{{execute}}

Once you submit some declarations for the pipeline we will revisit this `tnk` tool.
