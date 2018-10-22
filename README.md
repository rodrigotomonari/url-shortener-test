# Url Shortener Code Test

## Instructions

**Using Docker**

The easiest way to run the project is using Docker:

```
# Replace the IMAGE_NAME with a proper name

$ docker build -t IMAGE_NAME .
$ docker run -p 3000:3000 IMAGE_NAME rails s -b 0.0.0.0
```

And to execute the tests run:

`$ docker run IMAGE_NAME bin/rspec`

**Installing without Docker**

To install on the local machine, some required packages have to be installed
(see Requirements section)

```
$ bundle install
$ yarn
$ rails s
```
And to execute the tests run:

`$ bin/rspec`

## Requirements

- Ruby (see .ruby-version)
- Node
- Yarn

## Using the application

To use the application, access the URL `http://localhost:3000` in the web browser
and use the frontend interface.

Or send requests using curl to the endpoints:

```
$ curl localhost:3000 -XPOST -d '{ "url": "http://www.farmdrop.com" }'

$ curl -v localhost:3000/SHORT_URL
```

## Considerations and explanations

The main logic of the application is in the class **UrlShortener** located in
**app/models/url_shortener.rb**. The class is responsible for shortening the URLs.
The class depends on the **storage** abstraction, that is responsible for
*persisting* the URLs. This way it's possible to use different persistence
storage without changing the **UrlShortener** class.

So for persisting the URLs in memory, as the tests required, was created the
storage MemoryStorage located in **app/models/storages/memory_storage.rb**,
that uses a class instance.

The algorithm to generate the short_url is quite simple. It generates a random
key for all new URL. Maybe the algorithm could be improved to not generate a
new short_url for URLs already stored. Or it could always generate the same
short_url for the same URL, like a hash algorithm. But this improvements would
depend on a better understanding of the applicabilities of the application.

The frontend application was made using VueJS. All the components are located
in the folder `app/javascript/`.

Bootstrap library was used to style the application.

## The Test

Without using an external database, we'd like you to create a URL shortening
service. The URLs do not need to persist between restarts, but should be
shareable between different clients while the server is running.

- There should be an endpoint that responds to `POST` with a json body
  containing a URL, which responds with a JSON repsonse of the short url and
  the orignal URL, as in the following curl example:

```
curl localhost:4000 -XPOST -d '{ "url": "http://www.farmdrop.com" }'
{ "short_url": "/abc123", "url": "http://www.farmdrop.com" }
```


- When you send a GET request to a previously returned URL, it should redirect
  to the POSTed URL, as shown in the following curl example:

```
curl -v localhost:4000/abc123
...
< HTTP/1.1 301 Moved Permanently
...
< Location: http://www.farmdrop.com
...
{ "url": "http://www.farmdrop.com" }
```

Use whatever languages and frameworks you are comfortable with. Don't worry
about getting the whole thing working flawlessly, this is more to see how you
structure a program. Please don't spend more than a few hours on it.

Bonus points:

- I often forget to type "http://" at the start of a URL. It would be nice if
  this was handled by the application (frontend or backend is up to you).
- We like to see how you approach the problem, so a few git commits with a
  clear message about what you're doing are better than one git commit with
  everything in it.
- We like tests. We don't expect a full test suite, but some tests would be
  nice to see. Its up to you whether thats integration, unit or some other
  level of testing.
- We'd be very happy to see a Dockerfile to run the project. This by no means a
  requirement, so don't go reading the Docker docs if you've never worked with
  it.
- If you'd like to show off your frontend skills, you could create a simple
  frontend that can create and display shortened URLs without reloading the
  page.

## Submission

Please clone this repository, write some code and update this README with a
guide of how to run it.

Either send us a link to the repository on somewhere like github or bitbucket
(bitbucket has free private repositories) or send us a git bundle.

    git bundle create yournamehere-url-shortener-test.bundle master

And send us the resulting `yournamehere-url-shortener-test.bundle` file.

This `.bundle` file can be cloned using:

    git bundle clone bundle-filename.bundle -b master directory-name
