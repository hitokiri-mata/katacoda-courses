The distillation pattern is all about stripping things down to the bare essentials. This is also the goal of high cohestion in software architectures. Those things that are needed should be in the container, those things never used, should be removed. In conjunction with the evolution of contains so too has the Java ecosystem been evolving to adapt to this new type of target. The notions of projects Jigsaw and the move to modularize the JRE starting with Java 9 has been timly and fortunate. 

## Java 9+ Modularity ##

It's unlikely our applications, even our ginormous monolithic WARs. do not use every feature found in the JRE. So would these extra modules appear in our container? For instance, if our code or 3rd party libraries never imported the `import java.sql` then Java 9 modularization allows us to strip  out the JDBC API.  

Starting with Java 9, two helpful utilities were added called JDeps and JLink assist in finding used modules and excluding unused modules. These tools enable the distillation pattern the JRE.

### JDeps ###
JDeps analyzes your application classpath(s) and itemizes all of the dependencies and core Java features your application references. With this information you now know what modules you need and don't need in your container. Special lists are needed for those things reflective.

### JLink ###
JLink, in conjunction with the JDeps analysis, generates an custom and tuned package that includes only the JRE modules deemed necessary along with your application. Think of it as a customized JRE.

