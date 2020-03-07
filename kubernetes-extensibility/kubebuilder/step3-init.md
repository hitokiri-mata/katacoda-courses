Kubebuild has an init command that creates a local directory populated with the skelton to start writing your Operator.

`export GO111MODULE=on`{{execute}}

`mkdir $GOPATH/src/example; cd $GOPATH/src/example`{{execute}}

`kubebuilder init --domain my.domain`{{execute}}


