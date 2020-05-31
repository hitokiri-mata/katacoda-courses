A container image is a [tar file](https://en.wikipedia.org/wiki/Tar_\(computing\)) containing tar files. Internally, each tar file is a layer. Once all tar files have been extracted to a local filesystem, you can explore the details of the layers.

Using the docker tool, pull the layers of a Redis container image onto this filesystem.

`docker pull redis:6.0.4-alpine3.11`{{execute}}

Create a scratch location to inspect the Redis files.

`mkdir redis && cd redis`{{execute}}

Export the image into a raw tar format.

`docker save redis:6.0.4-alpine3.11 > redis.tar`{{execute}}

Extract the files from the tar.

`tar -xvf redis.tar`{{execute}}

All of the contents along with the layer tar files are now viewable.

`tree`{{execute}}



`cat repositories`{{execute}}

The image also includes the manifest.json file that defines the metadata about the image, such as version information and tag names. The [schema for the manifest.json](https://github.com/opencontainers/image-spec/blob/master/manifest.md) file follows the OCI specification. Inspect the manifest.

`cat manifest.json | jq .`{{execute}}

Extracting a layer will reveal the specific files contained for that layer.

`tar -xvf a9cc4ace48cd792ef888ade20810f82f6c24aaf2436f30337a2a712cd054dc97/layer.tar`{{execute}}
