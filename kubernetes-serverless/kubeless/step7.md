# Deploy Node Function #

There are addtional languages also supported out of the box from Kubeless. Here is a NodeJS example.

Deploy the function

`kubeless function deploy hello --trigger-http --runtime nodejs6 --from-file hello.js --handler hello.greeting`{{execute}}

Excersize the function

`kubeless function call hello --data '{"kubeless":"rocks"}`{{execute}}

See it listed,

`kubeless function list`

and described.

`kubeless function describe hello`{{execute}}