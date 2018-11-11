# Analyze Project with Gradle Plugins #

First, grab some example Java code.

`git clone https://github.com/javajon/code-analysis`{{execute}}

This project includes a microservice directory that contains a small Spring Boot application that is built with Gradle. Go into the application source root directory.

`cd code-analysis/microservice`{{execute}}

`chmod +x gradlew`{{execute}}

Use Gradle to run a series of tasks related to performing static code analysis.

`./gradlew check`{{execute}}

These are all Gradle plugins that generate reports in the build/reports directory.