Aside from SonarQube there are other ways to analyze a project. Use Gradle to run a series of tasks related to performing static code analysis.

`./gradlew check`{{execute}}

These will invoke a series of Gradle plugins associated with static code analysis. They will take a few moments to generate reports in the build/reports directory.
