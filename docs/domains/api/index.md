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
`domains:name_server` | Read and write access to name servers
`domains:name_server.read` | Read only access to name servers

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