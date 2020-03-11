To distribute a KUDO operator the files are packaged together in a compressed tarball file. The KUDO CLI tool provides a mechanism to create this package format while verifying the integrity of the operator.

## Create Package

Since this is a Katacoda instance, we can safely wipe the entire repo directory and create a new one.

`rm -rf ~/repo && mkdir -p ~/repo`{{execute}}

Bundle the operator code into a tarball as a package.

`kubectl kudo package create repository/first-operator/operator/ --destination=~/repo`{{execute}}

You now have a new single file package for the operator.

`tree ~/repo`{{execute}}

or?

`ls ~/repo`{{execute}}
