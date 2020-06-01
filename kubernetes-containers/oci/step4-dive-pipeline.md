This tool can also be added to your CI/CD pipelines to alert you when it encounters inneficient and bloated containers that surpass your defined thresholds.

Let's build two containers with the same Python code to illustrate the process for tuning containers.

### Bloated Container (a)

The first container will be a fat container using a Dockerfile that has several bad practices.

`cat Dockerfile-a`{{execute}}

Build the container.

`docker build -t fibonacci-a --file Dockerfile-a .`{{execute}}

Run the container.

`docker run fibonacci-a`{{execute}}

Let's see what the Dive tool thinks of this container. Generate the report.

`dive fibonacci-a -j dive-report-a.json`{{execute}}

View the report.

`cat dive-report-a.json | jq .`{{execute}}

There are many details, so instead pick out some key findings.

```
echo "              Size: $(cat dive-report-a.json | jq .image.sizeBytes) bytes" && \
echo "       Inefficient: $(cat dive-report-a.json | jq .image.inefficientBytes) bytes" && \
echo "Inefficiency score: $(cat dive-report-a.json | jq .image.efficiencyScore)"
```{{execute}}

### Trimmed Container (b)

The Dockerfile-b is a typical revision of a Dockerfile for Python with several best practices applied.

`cat Dockerfile-b`{{execute}}

There are more best (or better) practices, tuning, and opinions that can be applied, but let's start with this.

Build the container.

`docker build -t fibonacci-b --file Dockerfile-b .`{{execute}}

Run the container.

`docker run fibonacci-b`{{execute}}

Let's see what the Dive tool thinks of this container. Generate the report.

`dive fibonacci-b -j dive-report-b.json`{{execute}}

With both container reports generated, compare the key findings.

```
echo "Container Image a" && \
echo "              Size: $(cat dive-report-a.json | jq .image.sizeBytes) bytes" && \
echo "       Inefficient: $(cat dive-report-a.json | jq .image.inefficientBytes) bytes" && \
echo "Inefficiency score: $(cat dive-report-a.json | jq .image.efficiencyScore)" && \
echo "" && echo "Container Image b" && \
echo "              Size: $(cat dive-report-b.json | jq .image.sizeBytes) bytes" && \
echo "       Inefficient: $(cat dive-report-b.json | jq .image.inefficientBytes) bytes" && \
echo "Inefficiency score: $(cat dive-report-b.json | jq .image.efficiencyScore)"
```{{execute}}

With this tool you can add thresholds to these values. You can be notified or force your pipeline to stop when newly built containers exceed your acceptable limits. This in turn can save you money by not wasting cloud resources (CPU, memory, and I/O) when you containers scale across your cluster. Documentation on the [Dive's CI Integration is found here](https://github.com/wagoodman/dive#ci-integration).

<img align="right" src="./assets/alex-goodman-jpg" width="200">
Tip of the hat to [Alex Goodman](https://github.com/wagoodman) for this community contribution.
