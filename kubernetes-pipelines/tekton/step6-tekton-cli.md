

```bash
sudo apt update;sudo apt install -y gnupg && \
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3EFE0E0A2F2F60AA && \
echo "deb http://ppa.launchpad.net/tektoncd/cli/ubuntu eoan main"|sudo tee /etc/apt/sources.list.d/tektoncd-ubuntu-cli.list && \
sudo apt update && sudo apt install -y tektoncd-cli
```{{execute}}

More details on its various installation forms is in the [installation documentation](https://github.com/tektoncd/cli).

Verify the CLI tool is installed and can control the Tekton control plane.
`tkn version`{{execute}}

Add CLI autocompletion

`source <(tkn completion bash)`{{execute}}