Kubebuild requres Go 1.13+. Ensure we have a good version as a prerequisite,

`go version`{{execute}}

`export GO111MODULE=on`{{execute}}

`mkdir -p $GOPATH/src/example; cd $GOPATH/src/example`{{execute}}


Kubebuild has an init command that creates a local directory populated with the skelton to start writing your Operator.

`kubebuilder init --domain my.domain`{{execute}}

It will take a few moments to download and cache the dependencies.
