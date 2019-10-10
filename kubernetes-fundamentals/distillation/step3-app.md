There is a simple application that lists the files from the current directory. It's written in Java and can readily be cloned.

`git clone https://github.com/javajon/listdir`{{execute}}

Inspect the directory contents.

`cd listdir && tree`{{execute}}

ListDir is a standard Java application with a main that lists files in the current directory. All of it can be built and run using Gradle.

`./gradlew run`{{execute}}

This will create an executable jar.

`./gradlew jar`{{execute}}

The jar task creates an executable jar around 2K in size.

`ll build/libs/listdir*`{{execute}}

So far, this is a simple app and using our local operating system with Java installed we can run this application.

However, as we know relying on prerequait installs of precises operating systems, utility and runtimes like Java are all points of failure between developments, testing and production. Stacks we rely on are never as idempotent as we often blindly hope. 

