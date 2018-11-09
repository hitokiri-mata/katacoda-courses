# SonarQube on Kubernetes #

![SonarQube](/javajon/courses/kubernetes-applications/sonarqube/assets/sonarqube.png "Code Analysis with SonarQube on Kubernetes.")

Setting up your SonarQube services(s) as fragile [snowflakes](https://martinfowler.com/bliki/SnowflakeServer.html) is both common and not a recommended technique. Any developer should be able to quickly start a service or rely on a team service that matches the same behaviors. The latest SonarQube version, it's plugins and it's configurations should also be easily adjustable. Your software development lifecycle processes (SDLC) should embrace the versioned configuration and deployment of SonarQube across a variety of [cattle (not pets)](http://cloudscaling.com/blog/cloud-computing/the-history-of-pets-vs-cattle/) targets.

Follow these instructions to setup a personal [SonarQube engine and dashboard](https://www.sonarqube.org). With this you have a strong static code analysis tool backing your code changes all before you submit your work for pull requests. Within SonarQube there are plugins such as for Checkstyle, PMD and Findbugs. The Fingbugs plugin includes rules for vulnerabilities such as the [OWASP top 10](http://find-sec-bugs.github.io).

You will learn how:

- Install SonarQube onto Kubernetes
- Use Helm to install SonarQube on Minikube
- Configure SonarQube plugins with the chart
- Access SonarQube Dashboard
- Analyze code and inspect results with a Gradle plugin

> [SonarQube](https://www.sonarqube.com) is an open source platform developed by SonarSource for continuous inspection of code quality to perform automatic reviews with static analysis of code to detect bugs, code smells, and security vulnerabilities on 20+ programming languages. SonarQube offers reports on duplicated code, coding standards, unit tests, code coverage, code complexity, comments, bugs, and security vulnerabilities. [-- Wikipedia](https://en.wikipedia.org/wiki/sonarqube)