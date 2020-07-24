# Domain renew orders

A domain renew order manages the process of extending the life of a domain.
    
## Example object

```json
{
    "url": "https://domains.glauca.digital/api/domain_renew_orders/18337cab-4390-41c5-8fda-56cf7bec0ab3/",
    "id": "18337cab-4390-41c5-8fda-56cf7bec0ab3",
    "redirect_uri": null,
    "last_error": "Your card has insufficient funds.",
    "off_session": true,
    "price": 160.0,
    "state": "failed",
    "domain": "adriana-as207960.co.uk",
    "domain_obj": "03bf5478-6899-410b-adbb-f9f2948a4bc3",
    "domain_obj_url": "https://domains.glauca.digital/api/domains/03bf5478-6899-410b-adbb-f9f2948a4bc3/",
    "period": {
        "unit": "y",
        "value": 2
    }
}
```
    
## Object field description

### `url`, `id`, `state`, `last_error`, `price`, `off_session`

See [here](/domains/api/objects/order/)

### `domain`
> Read only

The domain to be renewed.

### `domain_obj`
> Read only, nullable
>
> Reference to a [domain](/domains/api/objects/domain/)

The domain object that is to be renewed.

### `domain_obj_url`
> Read only

The canonical URL of domain object.

### `period`
> Write once

The period to renew the domain for.

#### `period.unit`

The unit of time for this period. Valid values are;

* `y` - Years
* `m` - Months (not currently used)

#### `period.value`

The value of the unit for this period.
  
## List renew orders

Required scopes:

- `domains:domain.read`
- OR `domains.domain` 

```http
GET  /api/domain_renew_orders/ HTTP/1.1
```
  
## Retrieve a renew order

Required scopes:

- `domains:domain.read`
- OR `domains.domain` 

```http
GET  /api/domain_renew_orders/<object_id>/ HTTP/1.1
```
  
## Create a renew order

Required scopes:

- `domains:domain.renew` 

```http
POST /api/domains/<domain_id>/renew/ HTTP/1.1
Content-Type: application/json

{
    "period": {
        "unit": "y",
        "value": 1
    },
    ...
}
```
  
## Update a renew order

Required scopes:

- `domains:domain.renew` 

### For a complete replacement

```http
PUT /api/domain_renew_orders/<object_id>/ HTTP/1.1
Content-Type: application/json

{
    "state": "started",
    ...
}
```

### To update a few fields only

```http
PATCH /api/domain_renew_orders/<object_id>/ HTTP/1.1
Content-Type: application/json

{
    "state": "started"
}
```