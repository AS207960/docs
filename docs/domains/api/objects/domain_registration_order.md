# Domain registration orders

A domain registration order manages the process of registering a new domain.
    
## Example object

```json
{
    "url": "https://domains.glauca.digital/api/domain_registration_orders/4717d5b5-16e0-461d-8d9d-650bc03e7a5c/",
    "id": "4717d5b5-16e0-461d-8d9d-650bc03e7a5c",
    "redirect_uri": null,
    "last_error": null,
    "off_session": false,
    "price": 9.99,
    "state": "pending",
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
    "period": {
        "unit": "y",
        "value": 1
    }
}
```
    
## Object field description

### `url`, `id`, `state`, `last_error`, `price`, `off_session`

See [here](/domains/api/objects/order/)

### `domain`
> Write once

The domain to be registered.

### `domain_id`
> Read only

The ID that the domain objects will have if successfully registered.

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

### `period`
> Write once

The period to register the domain for.

#### `period.unit`

The unit of time for this period. Valid values are;

* `y` - Years
* `m` - Months (not currently used)

#### `period.value`

The value of the unit for this period.
  
## List registration orders

Required scopes:

- `domains:domain.read`
- OR `domains.domain` 

```http
GET  /api/domain_registration_orders/ HTTP/1.1
```
  
## Retrieve a registration order

Required scopes:

- `domains:domain.read`
- OR `domains.domain` 

```http
GET  /api/domain_registration_orders/<object_id>/ HTTP/1.1
```
  
## Create a registration order

Required scopes:

- `domains:domain.create` 

```http
POST /api/domain_registration_orders/ HTTP/1.1
Content-Type: application/json

{
    "domain": "example.com",
    "period": {
        "unit": "y",
        "value": 1
    },
    ...
}
```
  
## Update a registration order

Required scopes:

- `domains:domain.create` 

### For a complete replacement

```http
PUT /api/domain_registration_orders/<object_id>/ HTTP/1.1
Content-Type: application/json

{
    "domain": "example.com",
    "state": "started"
    ...
}
```

### To update a few fields only

```http
PATCH /api/domain_registration_orders/<object_id>/ HTTP/1.1
Content-Type: application/json

{
    "state": "started"
}
```