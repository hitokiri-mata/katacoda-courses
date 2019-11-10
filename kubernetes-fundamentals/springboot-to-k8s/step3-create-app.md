The Spring Boot frameworks offers an "initializr". The process create a skeletal framework for holding folders and source code for opinionated build tools such as Maven and Gradle. This process can be invoked from a variety of interfaces such as [a command line tool](https://docs.spring.io/spring-boot/docs/current/reference/htmlsingle/#cli-init) or a [web form](https://start.spring.io/). The following interface only requires the standard `curl` utility. Passed to the curl command are a variety of parameters to help us create the desired archetype for our application.

`curl -s https://start.spring.io/starter.tgz \
-d dependencies=web,actuator \
-d language=java \
-d type=gradle-project \
-d applicationName=HelloApplication \
-d groupId=example.hello \
-d name=hello \
-d baseDir=hello \
| tar -xzvf -`{{execute}}

In the my-app directory is the application skelton. We just need to add some code then it can be built and run.
