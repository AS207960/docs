# API Access

It is possible to access some services via an API so you can have your computer minions
do the dirty work for you. Please see each service's respective documentation for details
about API availability.

## OAuth

All our services use OAuth for authentication and UMA2 for authorization.

The OAuth discovery document can be found [here](https://sso.as207960.net/auth/realms/master/.well-known/openid-configuration).
This will give you all the required endpoints to perform OAuth against an account.

### Client registration

To create and manage your OAuth clients please use the console [here](http://oauth.as207960.net/).

### Scope whitelisting

Most actions are protected by requesting scopes at the point of authorization.
The user will be asked to consent to your application having access to the scopes
you've requested. When registering your client you'll need email us to tell us what 
scopes you want access to and to provide a reason for each scope.

### Service account

Each client will get its own service account, using the client credentials grant type,
for managing resources directly related to the client in question. Not much useful can 
be done with the service account though and most actions will require being authorized to
access a user's account.

### Refresh tokens

The tokens issued to clients are very short lived (on the order of minutes), which means
your application will have to support refresh tokens to properly interact with our APIs.

## Making API requests

### API authorization

When attempting to access one of our APIs authorization can be provided by the HTTP
authorization header, as demonstrated below;

```http
GET /api/resource/1 HTTP/1.1
Host: example.glauca.digital
Authorization: Bearer <your token>
```

### Content type

In general our APIs can accept data as a JSON body or as a form submission, and can return
data as JSON or as HTML to be rendered to a user.

Be sure to declare the appropriate `Content-Type` when talking to our APIs to ensure your
request in understood correctly, as shown below;

```http
POST /api/resource/1 HTTP/1.1
Host: example.glauca.digital
Authorization: Bearer <your token>
Content-Type: application/json; charset=utf-8
Accept: application/json

{
  "some": "data"
}
```

```http
HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8

{
  "some": "data"
}
```


### Errors

Errors are mostly communicated through HTTP status codes. Here's a quick summary of the ones
you'll likely see.

* `#!http 200 OK` - All is well.
* `#!http 201 Created` - All is well, and something was created.
* `#!http 204 No content` - All is well, and we have nothing else to say.
* `#!http 400 Bad request` - Ew! Invalid data is *not* tasty!
* `#!http 402 Payment Required` - We failed to charge your account, we need more money!
* `#!http 403 Forbidden` - You're not allowed to do that, naughty!
* `#!http 404 Not Found` - Zere is nothing ere.
* `#!http 409 Confilct` - Something already exists here, go someplace else!
* `#!http 429 Too Many Requests` - Slow down! We can't take it!
* `#!http 500 Internal Server Error` - We fucked up.