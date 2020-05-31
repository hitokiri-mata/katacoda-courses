A container image is a <a href="https://en.wikipedia.org/wiki/Tar_(computing)">tar file</a> containing tar files. Internally, each tar file is a layer. Once all tar files have been extracted to a local filesystem, you can explore the details of the layers.

Using the docker tool, pull the layers of a Redis container image onto this filesystem.

`docker pull redis:6.0.4-alpine3.11`{{execute}}

Export the image into a raw tar format.

`docker save redis:6.0.4-alpine3.11 > redis.tar`{{execute}}

Create a scratch location to inspect the Redis files.

`mkdir redis && cd redis`{{execute}}

Extract the files from the tar.

`tar -xvf ../redis.tar`{{execute}}

All of the contents along with the layer tar files are now viewable.

`tree`{{execute}}

The image includes the manifest.json file that defines the metadata about the image, such as version information and tag names. The [schema for the manifest.json](https://github.com/opencontainers/image-spec/blob/master/manifest.md) file follows the OCI specification. Inspect the manifest.

`cat manifest.json | jq .`{{execute}}

Extracting a layer will reveal the specific files contained for that layer.

`mkdir last-layer && tar -xvf 014d4966196e17dec4032a93660d4be192558c0a654af6347a6e012742079d6c/layer.tar -C last-layer`{{execute}}

Inspect the files in the last layer.

`tree last-layer`{{execute}}

This single file makes sense because it's the last instruction in the Redis Dockfile that would cause a layer to be created, [on line 100 here](https://github.com/docker-library/redis/blob/master/6.0/Dockerfile).
