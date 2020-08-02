Nuclio has a command-line interface (CLI) tool named appropriately `nuctl`. Use this tool to manage your functions on Nuclio. Let's get a recent Nuclio command-line interface (CLI) binary for this Linux account.

`curl -L https://github.com/nuclio/nuclio/releases/download/$NUCLIO_VERSION/nuctl-$NUCLIO_VERSION-linux-amd64 -o /usr/local/bin/nuctl && chmod +x /usr/local/bin/nuctl`{{execute}}

This tool version will match the controller installed. Verify this CLI is working by inspecting its current version.

`nuctl --help && nuctl version`{{execute}}
