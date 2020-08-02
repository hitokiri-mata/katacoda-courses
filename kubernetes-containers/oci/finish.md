<img align="right" src="./assets/linux-foundation-logo.png" width="300">
There are other container formats, but the industry is moving toward the standard and governed OCI format. After completing this scenario, you now understand it's a collection of TAR files where each TAR is a layer. With this knowledge, it's now easy to inspect the contents of a container for discovery and debugging purposes. With this standard OCI format, you can see why there is a growing variety of tools that can build, run, and inspect OCI container images.

## Lessons Learned ##

With these steps you have learned:

- &#x2714; The directory and file ingredients of container image binaries.
- &#x2714; How to create a runnable container without writing a Dockerfile.
- &#x2714; How to install and use the Dive tool to inspect container images.

Hopefully, you also understand how Kubernetes is a new type of data center _operating system_ that can run your applications—across multiple nodes on your local laptop, a rack of servers, or any cloud target.

## References ##

- ["A Practical Introduction to Container Terminology"](https://developers.redhat.com/blog/2018/02/22/container-terminology-practical-introduction/)
- [OCI Image Format Specification](https://github.com/opencontainers/image-spec/blob/master/spec.md)
- ["Demystifying the Open Container Initiative (OCI) Specifications"](https://www.docker.com/blog/demystifying-open-container-initiative-oci-specifications/)
- <a href="https://en.wikipedia.org/wiki/Tar_(computing)">TAR file</a>
- [BusyBox](https://busybox.net/FAQ.html)
- [Moby Project](https://github.com/moby/moby)
- ["Broken by default: why you should avoid most Dockerfile examples," by Itamar Turner-Trauring](https://pythonspeed.com/articles/dockerizing-python-is-hard/)
- [Dive](https://github.com/wagoodman/dive)
- [Alex Goodman](https://github.com/wagoodman)

------
<p style="text-align: center; padding: 1em; margin: 3em; margin-left: 10em; margin-right: 10em; border-; 1px; border-color: olive;  border-radius: 12px; border-style:outset">
<img align="left" src="./assets/jonathan-johnson.jpg" width="100" style="border-radius: 12px">
For a deeper understanding of these topics and more, join <br>[Jonathan Johnson](http://www.dijure.com)<br> at various conferences, symposiums, workshops, and meetups.
<br><br>
<b>Software Architectures ★ Speaker ★ Workshop Hosting ★ Kubernetes & Java Specialist</b>
</p>
