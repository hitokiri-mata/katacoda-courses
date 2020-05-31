## CI/CD Pipeline Integration

This tool can also be added to your pipeline and can alert you when it encounters large or bloated containers that surpass a threshold defined by you.

Let's build two containers with Python that can illustrate a process for tuning containers.

### Bloated Container (A)

The first container will be a fat container using a Dockerfile that has several bad practices.

`cat Dockerfile-A`{{execute}}

Build the container.

`docker build -t fibonacci-A --file Dockerfile-A .`{{execute}}

And run the container.

`docker run fibonacci-A 5`{{execute}}

Let's see what the Dive tool thinks of this container. Generate the report.

`dive fibonacci-A -j dive-report-A.json`{{execute}}

View the report.

`cat dive-report-A.json | jq .`{{execute}}

There are many details, so instead pick out some key findings.

`cat dive-report-A.json | jq .`{{execute}}

### Trimmed Container B

The B Dockerfine is a typical revision of a Dockerfile for Python with several best practices applied.

`cat Dockerfile-A`{{execute}}

There are more best practices and tuning that can be done, but let's start with this. Build the container.

`docker build -t fibonacci-B --file Dockerfile-B .`{{execute}}

And run the container.

`docker run fibonacci-B 5`{{execute}}

Let's see what the Dive tool thinks of this container. Generate the report.

`dive fibonacci-B -j dive-report-B.json`{{execute}}

With both container reports generated, compare the key findings.

`cat dive-report-A.json | jq .`{{execute}}
`cat dive-report-B.json | jq .`{{execute}}

