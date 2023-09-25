# Name servers

Name servers (or glue records) are used to provide IP addresses for name servers where 
they would otherwise be unavailable. For more information see [here](/domains/hosts/).
    
## Example object

```json
{
    "url": "https://domains.glauca.digital/api/name_servers/8ac32ac2-0af3-4657-a930-69a89c3164a2/",
    "id": "8ac32ac2-0af3-4657-a930-69a89c3164a2",
    "name_server": "ns1.example.com.",
    "statuses": [
        "ok",
        "linked"
    ],
    "addresses": [
        "1.2.3.4"
    ],
    "created": "2020-07-22T20:00:07Z",
    "last_updated": null,
    "last_transferred": null
}
```
    
## Object field description

### `url`
> Read only

The canonical URL of this resource in the API  

### `id`
> Read only

The ID of this object. It is currently a UUID but do not make assumptions about its
format, treat it as an opaque identifier.

### `name_server`
> Write once

The DNS name of the name server object.

### `statuses`
> Read only

A list of object statuses. Valid values are;

* `client_delete_prohibited`
* `client_update_prohibited`
* `linked`
* `ok`
* `pending_create`
* `pending_delete`
* `pending_transfer`
* `pending_update`         
* `server_delete_prohibited`
* `server_update_prohibited`

### `addresses`
A list of string formatted IPv4 or IPv6 addresses.
Both protocols can appears in any order in this list.

### `created`
> Read only

The date and time this object was created in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
format.

### `last_updated`
> Read only, nullable

The date and time this object was last updated in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
format.

### `last_transferred`
> Read only, nullable

The date and time this object was last transferred in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
format.
  
## List name servers

Required scopes:

- `domains:name_server.read`
- OR `domains:name_server` 

```http
GET /api/name_servers/ HTTP/1.1
```
  
## Retrieve a name_server

Required scopes:

- `domains:name_server.read`
- OR `domains:name_server` 

```http
GET /api/name_servers/<object_id>/ HTTP/1.1
```
  
## Create a name_server

Required scopes:

- `domains.name_server` 

```http
POST /api/name_servers/ HTTP/1.1
Content-Type: application/json

{
    "name_server": "ns1.example.com",
    "addresses": [...]
}
```
  
## Update a name_server

Required scopes:

- `domains:name_server` 

### For a complete replacement

```http
PUT /api/name_servers/<object_id>/ HTTP/1.1
Content-Type: application/json

{
    "addresses": [...],
    ...
}
```

### To update a few fields only

```http
PATCH /api/name_servers/<object_id>/ HTTP/1.1
Content-Type: application/json

{
    "addresses": [...]
}
```
  
## Delete a name_server addresses

Required scopes:

- `domains:name_server` 

```http
DELETE /api/name_servers/<object_id>/ HTTP/1.1
```