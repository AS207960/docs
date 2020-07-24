# Domains

A domain objects represents all the top level information about a domain 
    
## Example object

```json
{
    "url": "https://domains.glauca.digital/api/domains/04bbf0c4-baa8-42cd-be43-3501f3503eda/",
    "id": "04bbf0c4-baa8-42cd-be43-3501f3503eda",
    "domain": "magicalcodewit.ch",
    "statuses": [
        "ok"
    ],
    "deleted": false,
    "registrant": "a045b379-8aa1-4599-a3a2-998cda8503f3",
    "registrant_url": "https://domains.glauca.digital/api/contacts/a045b379-8aa1-4599-a3a2-998cda8503f3/",
    "admin_contact": "a045b379-8aa1-4599-a3a2-998cda8503f3",
    "admin_contact_url": "https://domains.glauca.digital/api/contacts/a045b379-8aa1-4599-a3a2-998cda8503f3/",
    "billing_contact": "a045b379-8aa1-4599-a3a2-998cda8503f3",
    "billing_contact_url": "https://domains.glauca.digital/api/contacts/a045b379-8aa1-4599-a3a2-998cda8503f3/",
    "tech_contact": "a045b379-8aa1-4599-a3a2-998cda8503f3",
    "tech_contact_url": "https://domains.glauca.digital/api/contacts/a045b379-8aa1-4599-a3a2-998cda8503f3/",
    "name_servers": [
        {
            "host_object": "ns1.as207960.net",
            "host_name": null,
            "addresses": null
        },
        {
            "host_object": "ns2.as207960.net",
            "host_name": null,
            "addresses": null
        }
    ],
    "hosts": [],
    "rgp_state": [],
    "auth_info": "abc123",
    "sec_dns": {
        "max_sig_life": null,
        "ds_data": [
            {
                "key_tag": 6687,
                "algorithm": 13,
                "digest_type": 2,
                "digest": "66818ACF61D1EF06C90B5871A045E2302A7474A6BAC046FE3FE23B9338F9D559",
                "key_data": null
            }
        ],
        "key_data": null
    },
    "created": null,
    "expiry": "2020-08-23T21:59:59Z",
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

### `domain`
> Read only

The domain name.

### `statuses`
> Read only

A list of object statuses. Valid values are;

* `client_delete_prohibited`
* `client_hold`
* `client_renew_prohibited`
* `client_transfer_prohibited`
* `client_update_prohibited`
* `inactive`
* `ok`
* `pending_create`
* `pending_delete`
* `pending_transfer`
* `pending_update`         
* `server_delete_prohibited`
* `server_hold`
* `server_renew_prohibited`
* `server_transfer_prohibited`
* `server_update_prohibited`

### `deleted`

If the domain has been deleted as in its redemption period. No updates to the domain
can be made in this state.

### `registrant`
> Reference to a [contact](/domains/api/objects/contact/)

The contact used as the domain's registrant.

### `registrant_url`
> Read only

The canonical URL of registrant contact.

### `admin_contact`
> Nullable
>
> Reference to a [contact](/domains/api/objects/contact/)

The contact used as the domain's admin contact.

### `admin_contact_url`
> Read only

The canonical URL of admin contact.

### `billing_contact`
> Nullable
>
> Reference to a [contact](/domains/api/objects/contact/)

The contact used as the domain's billing contact.

### `billing_contact_url`
> Read only

The canonical URL of billing contact.

### `tech_contact`
> Nullable
>
> Reference to a [contact](/domains/api/objects/contact/)

The contact used as the domain's tech contact.

### `tech_contact_url`
> Read only

The canonical URL of technical contact.

### `name_servers`

A list of DNS name servers authoritative for this server.

#### `name_servers.host_object`
> Nullable

The FDQN of a name server.

#### `name_server.host_name` 
> Nullable

The FDQN of a name server, when addresses are to be provided for glue records.
Not currently supported by any registry we use, use 
[name_server](/domain/api/objects/name_server/) objects instead.

#### `name_server.addresses`
> Nullable

A list of string formatted IPv6 or IPv4 addresses if `name_server.host_name` is used.

### `hosts`
> Read only

A list of [name_server](/domain/api/objects/name_server/) objects associated with this domain.

#### `hosts.host_object`
> Reference to a [name_server](/domain/api/objects/name_server/)

The ID of the name server object.

#### `hosts.host_object_url`

The canonical URL of the name server object.

### `rgp_state`
> Read only

A list of object grace period states. Valid values are;

* `unknown`
* `add_grace_period`
* `auto_renew_grace_period`
* `renew_grace_period`
* `transfer_grace_period`
* `redemption_grace_period`
* `pending_restore_grace_period`
* `pending_delete_grace_period`

### `auth_code`
> Read only

The auth code / EPP code to authorize the transferring of the domain.

### `sec_dns`
> Nullable

Data to do with [DNSSEC](https://tools.ietf.org/html/rfc4033) on this domain.
Only one of `ds_data` or `key_data` may ever be set at one time.

#### `sec_dns.max_sig_life`
> Nullable

The maximum signature life on the parent zone's RRSIG records covering this domain.

#### `sec_dns.ds_data`
> Nullable

A list of [DS](https://tools.ietf.org/html/rfc4034#section-5) records to be inserted in the
parent zone. 

##### `sec_dns.ds_data.key_tag`

The integer key tag for the DS record. 
As defined [here](https://tools.ietf.org/html/rfc4034#section-5.1.1)

##### `sec_dns.ds_data.algorithm`

The integer algorithm type for the DS record. 
As defined [here](https://tools.ietf.org/html/rfc4034#section-5.1.2)

##### `sec_dns.ds_data.digsest_type`

The integer digest type for the DS record. 
As defined [here](https://tools.ietf.org/html/rfc4034#section-5.1.3)

##### `sec_dns.ds_data.digsest`

The string digest for the DS record. Usually hex or base64 encoded.
As defined [here](https://tools.ietf.org/html/rfc4034#section-5.1.4)

##### `sec_dns.ds_data.key_data`
> Nullable

Option [DNSKEY](https://tools.ietf.org/html/rfc4034#section-2) data to be inserted into
the parent zone.

###### `sec_dns.ds_data.key_data.flags`

The integer key flags for the DNSKEY record.
As defined [here](https://tools.ietf.org/html/rfc4034#section-2.1.1)

###### `sec_dns.ds_data.key_data.protocol`

The integer protocol type for the DNSKEY record.
As defined [here](https://tools.ietf.org/html/rfc4034#section-2.1.2)

###### `sec_dns.ds_data.key_data.algorithm`

The integer algorithm type for the DNSKEY record.
As defined [here](https://tools.ietf.org/html/rfc4034#section-2.1.3)

###### `sec_dns.ds_data.key_data.public_key`

The base64 string representation of the public key for the DNSKEY record.
As defined [here](https://tools.ietf.org/html/rfc4034#section-2.1.4)

#### `sec_dns.key_data`
> Nullable
 
A list of [DNSKEY](https://tools.ietf.org/html/rfc4034#section-2) records to be 
inserted in the parent zone. The registry itself will compute the DS records.

##### `sec_dns.key_data.flags`

The integer key flags for the DNSKEY record.
As defined [here](https://tools.ietf.org/html/rfc4034#section-2.1.1)

##### `sec_dns.key_data.protocol`

The integer protocol type for the DNSKEY record.
As defined [here](https://tools.ietf.org/html/rfc4034#section-2.1.2)

##### `sec_dns.key_data.algorithm`

The integer algorithm type for the DNSKEY record.
As defined [here](https://tools.ietf.org/html/rfc4034#section-2.1.3)

##### `sec_dns.key_data.public_key`

The base64 string representation of the public key for the DNSKEY record.
As defined [here](https://tools.ietf.org/html/rfc4034#section-2.1.4)

### `block_transfer`
> Write only

Weather to set or remove the `client_transfer_prohibited` state on the domain.

### `regen_auth_code`
> Write only

Weather to create a new authorization code.

### `created`
> Read only

The date and time this object was created in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
format.

### `expiry`
> Read only

The date and time this object will expire in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
format.

### `last_updated`
> Read only, nullable

The date and time this object was last updated in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
format.

### `last_transferred`
> Read only, nullable

The date and time this object was last transferred in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
format.

## List domains

Required scopes:

- `domains:domain.read`
- OR `domains.domain` 

```http
GET  /api/domains/ HTTP/1.1
```
  
## Retrieve a domain

Required scopes:

- `domains:domain.read`
- OR `domains.domain` 

```http
GET  /api/domains/<object_id>/ HTTP/1.1
```
  
## Update a domain

Required scopes:

- `domains:domain` 

### For a complete replacement

```http
PUT /api/domains/<object_id>/ HTTP/1.1
Content-Type: application/json

{
    "admin_contact": null,
    "name_servers": []
    ...
}
```

### To update a few fields only

```http
PATCH /api/domains/<object_id>/ HTTP/1.1
Content-Type: application/json

{
    "block_transfer": true
}
```

## Check domain availability and price

Required scopes:

- NONE

```http
POST /api/domains/check/ HTTP/1.1
Content-Type: application/json

{
    "domain": "example.com",
    "period": {
        "unit": "y",
        "value": 1
    }
}
```

```http
HTTP/1.1 200 OK
Content-Type: application/json


{
    "domain": "example.com",
    "available": true,
    "reason": null,
    "price": "19.99"
}
```

## Check domain transfer availability and price

Required scopes:

- NONE

```http
POST /api/domains/check_transfer/ HTTP/1.1
Content-Type: application/json

{
    "domain": "example.aa",
    "period": {
        "unit": "y",
        "value": 1
    }
}
```

```http
HTTP/1.1 200 OK
Content-Type: application/json


{
    "domain": "example.aa",
    "available": false,
    "reason": "Unsupported or invalid domain",
    "price": null
}
```

## Check domain renewal price

Required scopes:

- `domains:domain.read`
- OR `domains.domain` 

```http
POST /api/domains/<object_id>/check_renew/ HTTP/1.1
Content-Type: application/json

{
    "domain": "example.com",
    "period": {
        "unit": "y",
        "value": 1
    }
}
```

```http
HTTP/1.1 200 OK
Content-Type: application/json


{
    "domain": "example.com",
    "available": true,
    "reason": null,
    "price": "19.99"
}
```

## Check domain restore price

Required scopes:

- `domains:domain.read`
- OR `domains.domain` 

```http
GET /api/domains/<object_id>/check_restore/ HTTP/1.1
```

```http
HTTP/1.1 200 OK
Content-Type: application/json


{
    "domain": "magicalcodewit.ch",
    "available": false,
    "reason": "Domain not in state to be restored",
    "price": null
}
```