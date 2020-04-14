Simplicity

7 different web frameworks
https://deepsource.io/blog/go-web-frameworks/

9 frameworks
https://www.mindinventory.com/blog/top-web-frameworks-for-development-golang/

https://medium.com/free-code-camp/learning-go-from-zero-to-hero-d2a3223b3d86

 Golang emerged as an alternative to C++ and Java for the app developers in the context of what Google needed for its network servers and distributed systems. The language was created to do away with the lack of pace and difficulties involved with programming for large and scalable servers and software systems. To be precise, at Google, Go came to offer the following solutions.
• Fast-paving compilation and execution
• Do away with the need of working with different subsets of languages for one project.
• A boost to code readability and documentation
• Offering a thoroughly consistent language
• Facilitating easy versioning of the program
• Allowing developing with multiple languages
• Allowing easier maintenance of dependencies
Now let us focus on few areas that made GoLang so special from all previous programming languages so far.

Easy to learn
Multithreading And Concurrency
No generics
Single executable, no runtime engine
no dynamic libraries

Logging,  OMG  - glog has bug, logrus is maintainenace, zap is fast, highest stars

List ideas
curl http://localhost:8080/ideas/v1/

List one idea
curl http://localhost:8080/ideas/v1/1

Create idea
curl --data "topic=new topic&idea=new idea" http://localhost:8080/ideas/v1/

Update
curl --data "topic=updated topic&idea=updated idea" -X PATCH http://localhost:8080/ideas/v1/2

Delete
curl -X "DELETE" http://localhost:8080/ideas/v1/1