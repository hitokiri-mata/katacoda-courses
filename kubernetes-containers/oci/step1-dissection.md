A container image is a [tar file](https://en.wikipedia.org/wiki/Tar_(computing)) containing tar files. Each tar file is a layer. Once all tar files have been extracted to a local filesystem, you can explore the details of the layers.

Using the docker tool, pull the layers of a Redis container image onto this filesystem.

`docker pull redis:6.0.4-alpine3.11`{{execute}}

Create a scratch location to inspect the Redis files.

`mkdir redis && cd redis`{{execute}}

Export the image into a raw tar format.

`docker save redis:6.0.4-alpine3.11 > redis.tar`{{execute}}

or

`docker save redis:6.0.4-alpine3.11 --output redis.tar`{{execute}}

Extract to the disk

`tar -xvf redis.tar`{{execute}}

All of the contents along with the layer tar files are now viewable.

`tree`{{execute}}

The image also includes metadata about the image, such as version information and tag names.

`cat repositories`{{execute}}

Inspect the manifest.json file.

`cat manifest.json | jq .`{{execute}}

Extracting a layer will reveal the specific files contained for that layer.

`tar -xvf da2a73e79c2ccb87834d7ce3e43d274a750177fe6527ea3f8492d08d3bb0123c/layer.tar`{{execute}}
