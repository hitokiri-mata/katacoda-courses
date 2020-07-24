Nuclio has a command-line interface (CLI) tool named appropriately `nuctl`. Use this tool to manage your functions on Nuclio. Let's get a recent Nuclio command-line interface (CLI) binary for this Linux account.

`curl -L https://github.com/nuclio/nuclio/releases/download/1.4.13/nuctl-1.4.13-linux-amd64 -o /usr/local/bin/nuctl && chmod +x /usr/local/bin/nuctl`{{execute}}

This tool version will match the controller installed in the next step. Verify this CLI is working by inspecting its current version.

`nuctl version && nuctl --help`{{execute}}
