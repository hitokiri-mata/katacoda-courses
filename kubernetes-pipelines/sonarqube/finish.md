# Conclusion #

Most developers who know about static code analysis know about SonarQube. While each language typically has its own linting and code analysis tools, SonarQube offers a unifying tools for many languages and teams. Additionally, SonarQube with its database offers the additional dimension of time to trend your metrics over time.

This tutorial shows how you can easily use Kubernetes as a place to host a highly available server for you and your team.

## Lessons Learned ##

With these steps you have learned how:

- to install SonarQube onto Kubernetes
- to use Helm to install SonarQube
- to configure SonarQube plugins with the chart
- to access the SonarQube Dashboard
- to analyze code and inspect results with a Gradle plugin

## Additional Information ##

* Visit the No Fluff Just Stuff [tour](https://nofluffjuststuff.com) and see this example in action. [Code Analysis and Team Culture](https://www.nofluffjuststuff.com/conference/speaker/jonathan_johnson)
* [SonarQube integration](https://www.sonarsource.com/why-us/integration/)
* [SonarCloud Nemo](https://sonarcloud.io/projects?sort=-analysis_date), SonarQube continuous analysis reporting of many open source projects.
* Understand more about the stable Helm chart for using [SonarQube on Kubernetes](https://github.com/kubernetes/charts/tree/master/stable/sonarqube)
* Intellij's plugin for SonarQube, [SonarLint plugin](https://www.sonarlint.org/intellij/howto.html)
* [Shift left](https://martinfowler.com/articles/rise-test-impact-analysis.html#ShiftLeftAndRight)
* [Snowflakes](https://martinfowler.com/bliki/SnowflakeServer.html)
* [Cattle not pets](http://cloudscaling.com/blog/cloud-computing/the-history-of-pets-vs-cattle/)
* [Checkstyle](http://checkstyle.sourceforge.net/)
* [PMD](https://pmd.github.io/)
* [Findbugs](http://findbugs.sourceforge.net/)
* Careful when upgrading SonarQube tag images or its plugins. It can be dependency hell with a complex matrix. If your container is failing it's due to mismatched versions.

------
![No Fluff Just Stuff](/javajon/courses/kubernetes-pipelines/sonarqube/assets/nfjs.png "No Fluff Just Stuff")

For a deeper understanding of these topics and more join me, [Jonathan Johnson](https://www.linkedin.com/in/javajon/), for a transcendent experience on the [No Fluff Just Stuff Software Symposium Tour](https://nofluffjuststuff.com/home/main).