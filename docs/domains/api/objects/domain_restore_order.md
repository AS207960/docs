# Domain restore orders

A domain restore order manages the process of restoring a domain after deletion.
    
## Example object

```json
{
    "url": "https:/domains.glauca.digital/api/domain_restore_orders/fa658f50-eee1-40ab-8205-67c2e430b568/",
    "id": "fa658f50-eee1-40ab-8205-67c2e430b568",
    "redirect_uri": null,
    "last_error": null,
    "off_session": true,
    "price": 0.0,
    "state": "failed",
    "domain": "adriana-as207960.co.uk",
    "domain_obj": "03bf5478-6899-410b-adbb-f9f2948a4bc3",
    "domain_obj_url": "https:/domains.glauca.digital/api/domains/03bf5478-6899-410b-adbb-f9f2948a4bc3/"
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

The domain to be restored.

### `domain_obj`
> Read only, nullable
>
> Reference to a [domain](/domains/api/domain/)

The domain object that is to be restored.

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

### `price`
> Read only

The cost associated with this order.

### `off_session`
> Write once

If true then a user isn't present to handle interactive tasks, and `redirect_uri` will
never be set, if false the opposite is true.

Defaults to `true`.
  
## List restore orders

Required scopes:

- `domains:domain.read`
- OR `domains.domain` 

```http
GET  /api/domain_restore_orders/ HTTP/1.1
```
  
## Retrieve a restore order

Required scopes:

- `domains:domain.read`
- OR `domains.domain` 

```http
GET  /api/domain_renew_orders/<object_id>/ HTTP/1.1
```
  
## Create a restore order

Required scopes:

- `domains:domain.restore` 

```http
POST /api/domains/<domain_id>/restore/ HTTP/1.1
Content-Type: application/json

{
    "off_session": true,
    ...
}
```
  
## Update a restore order

Required scopes:

- `domains:domain.restore` 

### For a complete replacement

```http
PUT /api/domain_restore_orders/<object_id>/ HTTP/1.1
Content-Type: application/json

{
    "state": "started",
    ...
}
```

### To update a few fields only

```http
PATCH /api/domain_restore_orders/<object_id>/ HTTP/1.1
Content-Type: application/json

{
    "state": "started"
}
```