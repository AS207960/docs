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
> Read only

The domain to be renewed.

### `domain_obj`
> Read only, nullable
>
> Reference to a [domain](/domains/api/domain/)

The domain object that is to be renewed.

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

### `period`
> Write once

The period to renew the domain for.

#### `period.unit`

The unit of time for this period. Valid values are;

* `y` - Years
* `m` - Months (not currently used)

#### `period.value`

The value of the unit for this period.

### `price`
> Read only

The cost associated with this order.

### `off_session`
> Write once

If true then a user isn't present to handle interactive tasks, and `redirect_uri` will
never be set, if false the opposite is true.

Defaults to `true`.
  
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