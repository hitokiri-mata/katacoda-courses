This step explores how to host an operator repository on your local system.

Build the Local index file.

`kubectl kudo repo index ~/repo`{{execute}}

Start the Repository HTTP server.

```bash
pushd ~/repo
python -m http.server 80&
popd
```{{execute}}

Add the local repository to the KUDO client.

`kubectl kudo repo add local http://localhost`{{execute}}

Set the local repository to the default KUDO context.

`kubectl kudo repo context local`{{execute}}

Confirm the KUDO context.

`kubectl kudo repo list`{{execute}}

The * next to local indicates that it is the default context for the KUDO client.

Verify you are using the local repository for an installation. Using the verbose CLI output flag (-v) with KUDO it is possible to trace from where an operator is being installed from.

`kubectl kudo install first-operator -v 9`{{execute}}

The output will indicate the operator is now running, albeit locally.
