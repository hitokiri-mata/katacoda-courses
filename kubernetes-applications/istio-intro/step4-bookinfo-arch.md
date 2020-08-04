The BookInfo sample application deployed is composed of four microservices:

The productpage microservice is the homepage, populated using the details and reviews microservices.
The details microservice contains the book information.
The reviews microservice contains the book reviews. It uses the ratings microservice for the star rating.
The ratings microservice contains the book rating for a book review.
The deployment included three versions of the reviews microservice to showcase different behaviour and routing:

Version v1 doesn’t call the ratings service.
Version v2 calls the ratings service and displays each rating as 1 to 5 black stars.
Version v3 calls the ratings service and displays each rating as 1 to 5 red stars.
The services communicate over HTTP using DNS for service discovery. An overview of the architecture is shown below.

BookInfo Architecture

The source code for the application is available on Github