A container image is a binary file that follows a specific standard. The emerging standard for this format is OCI, governed by the Open Container Initiative as part of the Linux Foundation. When a container runtime engine unpacks these files from the image and starts them on the operating system, then the container instance is running. In the end, containers are just normal processes that run on the operating system (commonly Linux).

<img align="right" src="./assets/oci-logo.png" width="300">
How containers are built and how container runtime engines interpret these images is interesting and often important to understand. The best place to start understanding how they function is to start with the container image payload.

You will learn:

- The directory and file ingredients of container image binaries.
- How to create a runnable container without writing a Dockerfile.
- How to install and use the Dive tool to inspect container images.
