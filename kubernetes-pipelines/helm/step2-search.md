You can now start deploying applications to Kubernetes based on public charts. To find available charts use the search command. 

For example, to deploy Redis search for that chart by name.

`helm search redis`{{execute}}

For many applications, sometimes there is more than one chart provider or project. Once found, more information may be revealed with the _inspect_ command.

`helm inspect stable/redis`{{execute}}
