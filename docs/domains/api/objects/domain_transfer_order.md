# Domain transfer orders

A domain transfer order manages the process of transferring a domain to us.
    
## Example object

```json
{
    "url": "https://domains.glauca.digital/api/domain_transfer_orders/4717d5b5-16e0-461d-8d9d-650bc03e7a5c/",
    "id": "4717d5b5-16e0-461d-8d9d-650bc03e7a5c",
    "redirect_uri": null,
    "last_error": null,
    "off_session": false,
    "price": 0,
    "state": "pending", 
    "auth_code": "abc123",
    "domain": "as207960.ch",
    "domain_id": "631a9f98-6f20-45a0-9468-d599f318133a",
    "domain_obj": null,
    "domain_obj_url": null,
    "registrant": "a045b379-8aa1-4599-a3a2-998cda8503f3",
    "registrant_url": "https://domains.glauca.digital/api/contacts/a045b379-8aa1-4599-a3a2-998cda8503f3/",
    "admin_contact": null,
    "admin_contact_url": null,
    "billing_contact": null,
    "billing_contact_url": null,
    "tech_contact": null,
    "tech_contact_url": null,
}
```
    
## Object field description

### `url`, `id`, `state`, `last_error`, `price`, `off_session`

See [here](/domains/api/objects/order/)

### `domain`
> Write once

The domain to be transferred.

### `domain_id`
> Read only

The ID that the domain objects will have if successfully transferred.

### `registrant`
> Write once
>
> Reference to a [contact](/domains/api/objects/contact/)

The contact to be used as the registrant of the domain.

### `registrant_url`
> Read only

The canonical URL of registrant contact.

### `admin_contact`
> Write once, nullable
>
> Reference to a [contact](/domains/api/objects/contact/)

The contact to be used as the admin contact of the domain.

### `admin_contact_url`
> Read only

The canonical URL of admin contact.

### `billing_contact`
> Write once, nullable
>
> Reference to a [contact](/domains/api/objects/contact/)

The contact to be used as the billing contact of the domain.

### `billing_contact_url`
> Read only

The canonical URL of billing contact.

### `tech_contact`
> Write once, nullable
>
> Reference to a [contact](/domains/api/objects/contact/)

The contact to be used as the technical contact of the domain.

### `tech_contact_url`
> Read only

The canonical URL of technical contact.

### `domain_obj`
> Read only, nullable
>
> Reference to a [domain](/domains/api/objects/domain/)

The domain object created upon successful registration

### `domain_obj_url`
> Read only

The canonical URL of domain object.

### `auth_code`
> Write once

The auth code / EPP code to authorize the transferring of the domain.

## List transfer orders

Required scopes:

- `domains:domain.read`
- OR `domains.domain` 

```http
GET  /api/domain_transfer_orders/ HTTP/1.1
```
  
## Retrieve a transfer order

Required scopes:

- `domains:domain.read`
- OR `domains.domain` 

```http
GET  /api/domain_transfer_orders/<object_id>/ HTTP/1.1
```
  
## Create a transfer order

Required scopes:

- `domains:domain.create` 

```http
POST /api/domain_transfer_orders/ HTTP/1.1
Content-Type: application/json

{
    "domain": "example.com",
    "auth_code": "abc123",
    ...
}
```
  
## Update a transfer order

Required scopes:

- `domains:domain.create` 

### For a complete replacement

```http
PUT /api/domain_transfer_orders/<object_id>/ HTTP/1.1
Content-Type: application/json

{
    "domain": "example.com",
    "state": "started"
    ...
}
```

### To update a few fields only

```http
PATCH /api/domain_transfer_orders/<object_id>/ HTTP/1.1
Content-Type: application/json

{
    "state": "started"
}
```