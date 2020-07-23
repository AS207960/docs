# API Overview

The root of the API is at [domains.glauca.digital/api/](https://domains.test.glauca.digital/api/).

This also provides an interactive playground when accessed via a browser that allows you to
do anything as your currently logged in user. This is not a test environment any anything
done on the playground will affect actual resources. When accessed via a client that sets
the correct `Accept` header the actual API will be exposed.

Please see the [API Overview](/api) for information on how to authenticate with the API.

## Scopes

The scopes available for the domains API are as follows;

Scope name | Purpose
--- | ---
`domains:domain` | Read and write access to domains
`domains:domain.read` | Read only access to domains
`domains:domain.create` | Register and transfer domains
`domains:domain.renew` | Renew domains
`domains:domain.restore` | Restore domains
`domains:contact` | Read and write access to contacts
`domains:contact.read` | Read only access to contacts
`domains:contact_address` | Read and write access to contact addresses 
`domains:contact_address.read` | Read only access to contact addresses

!!! tip
    `domains:domain.create`, `domains:domain.renew`, and `domains:domain.restore` are
     not included as part of `domains:domain` as these are chargeable actions and need to
     be requested seperately.
     
## Pagination

The default page size is 25 objects. Pagination can be achieved by using a `limit`
and an `offset` query parameter.

Paginated responses will also include a URL to the next and previous page, if available.

```http
HTTP/1.1 200 OK
Allow: GET, POST, HEAD, OPTIONS
Content-Type: application/json
Vary: Accept

{
    "count": 1,
    "next": null,
    "previous": "https://domains.glauca.digital/api/.../?limit=100&offset=300",
    "results": [
        ...
    ]
}
```

## Errors

Errors are mostly communicated through HTTP status codes. Here's a quick summary of the ones
you'll likely see on this API.

* `200 OK` - All is well.
* `201 Created` - All is well, and something was created.
* `204 No content` - All is well, and we have nothing else to say.
* `400 Bad request` - Ew! Invalid data is *not* tasty!
* `402 Payment Required` - We failed to charge your account, we need more money!
* `403 Forbidden` - You're not allowed to do that, naughty!
* `404 Not Found` - Zere is nothing ere.
* `409 Confilct` - Something already exists here, go someplace else!
* `429 Too Many Requests` - Slow down! We can't take it!
* `500 Internal Server Error` - We fucked up.