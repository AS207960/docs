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

### `url`, `id`, `state`, `last_error`, `price`, `off_session`

See [here](/domains/api/objects/order/)

### `domain`
> Read only

The domain to be restored.

### `domain_obj`
> Read only, nullable
>
> Reference to a [domain](/domains/api/objects/domain/)

The domain object that is to be restored.

### `domain_obj_url`
> Read only

The canonical URL of domain object.

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