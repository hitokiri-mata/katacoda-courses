## CI/CD Pipeline Integration

This tool can also be added to your pipeline and can alert you when it encounters large or bloated containers that surpass a threshold defined by you.

Let's build two containers with Python that can illustrate a process for tuning containers.

### Bloated Container (a)

The first container will be a fat container using a Dockerfile that has several bad practices.

`cat Dockerfile-a`{{execute}}

Build the container.

`docker build -t fibonacci-a --file Dockerfile-a .`{{execute}}

And run the container.

`docker run fibonacci-a 5`{{execute}}

Let's see what the Dive tool thinks of this container. Generate the report.

`dive fibonacci-a -j dive-report-a.json`{{execute}}

View the report.

`cat dive-report-a.json | jq .`{{execute}}

There are many details, so instead pick out some key findings.

`cat dive-report-a.json | jq .`{{execute}}

### Trimmed Container (b)

The Dockerfile-b is a typical revision of a Dockerfile for Python with several best practices applied.

`cat Dockerfile-b`{{execute}}

There are more best practices and tuning that can be done, but let's start with this. Build the container.

`docker build -t fibonacci-b --file Dockerfile-b .`{{execute}}

And run the container.

`docker run fibonacci-b 5`{{execute}}

Let's see what the Dive tool thinks of this container. Generate the report.

`dive fibonacci-b -j dive-report-b.json`{{execute}}

With both container reports generated, compare the key findings.

`cat dive-report-a.json | jq .`{{execute}}
`cat dive-report-b.json | jq .`{{execute}}
