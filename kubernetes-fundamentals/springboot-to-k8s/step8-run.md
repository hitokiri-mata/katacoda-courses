Now that the application is running obtain the service location of the application. Be sure access is via HTTP, not HTTPS.

`export APP=http://127.0.0.1:32500/`{{execute}}

You can exercise the application from the command line.

`curl -s "${APP}/hello"`{{execute}}
