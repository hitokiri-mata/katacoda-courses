# Deploy NodeJS Function #

There are additional languages also supported out of the box from Kubeless. Here is a NodeJS example. Deploy the function

`kubeless function deploy hello --runtime nodejs6 --from-file hello.js --handler hello.greeting`{{execute}}

See the new function listed and confirm the status is _Ready_, it may take a minute.

`kubeless function list`{{execute}}

Once ready, run the function

`kubeless function call hello --data '{"kubeless":"rocks"}'`{{execute}}

and described.

`kubeless function describe hello`{{execute}}