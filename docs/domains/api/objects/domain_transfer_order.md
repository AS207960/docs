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

### `url`
> Read only

The canonical URL of this resource in the API  

### `id`
> Read only

The ID of this object. It is currently a UUID but do not make assumptions about its
format, treat it as an opaque identifier.

### `state`

A the current order state. Valid values are;

* `pending`
* `started`
* `processing`
* `needs_payment`
* `pending_approval`
* `completed`
* `failed`

The valid state transitions are as follows;

* `pending` is an entry state
* `started` is an entry state
* from `pending`
    * to `started`
    * to `failed`
* from `started`
    * to `processing`
    * to `needs_payment`
    * to `failed`
* from `needs_payment`
    * to `processing`
    * to `failed`
* from `processing` 
    * to `pending_approval`
    * to `completed`
    * to `failed`
* from `pending_approval`
    * to `completed`
    * to `failed`
* `completed` is a terminal state
* `failed` is a terminal state

Can only be updated by an API call in the `pending` state.
Will automatically be set to `started` for orders created with the API.

### `domain`
> Write once

The domain to be transferred.

### `domain_id`
> Read only

The ID that the domain objects will have if successfully transferred.

### `registrant`
> Write once
>
> Reference to a [contact](/domains/api/contact/)

The contact to be used as the registrant of the domain.

### `registrant_url`
> Read only

The canonical URL of registrant contact.

### `admin_contact`
> Write once, nullable
>
> Reference to a [contact](/domains/api/contact/)

The contact to be used as the admin contact of the domain.

### `admin_contact_url`
> Read only

The canonical URL of admin contact.

### `billing_contact`
> Write once, nullable
>
> Reference to a [contact](/domains/api/contact/)

The contact to be used as the billing contact of the domain.

### `billing_contact_url`
> Read only

The canonical URL of billing contact.

### `tech_contact`
> Write once, nullable
>
> Reference to a [contact](/domains/api/contact/)

The contact to be used as the technical contact of the domain.

### `tech_contact_url`
> Read only

The canonical URL of technical contact.

### `domain_obj`
> Read only, nullable
>
> Reference to a [domain](/domains/api/domain/)

The domain object created upon successful registration

### `domain_obj_url`
> Read only

The canonical URL of domain object.

### `redirect_uri`
> Read only, nullable

The page to redirect a user to in case interactivity is required.

### `last_error`
> Read only, nullable

The last error encountered whilst registering the domain. If in the `failed` state, 
this is the reason for failure.

### `auth_code`
> Write once

The auth code / EPP code to authorize the transferring of the domain.

### `price`
> Read only

The cost associated with this order.

### `off_session`
> Write once

If true then a user isn't present to handle interactive tasks, and `redirect_uri` will
never be set, if false the opposite is true.

Defaults to `true`.
  
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