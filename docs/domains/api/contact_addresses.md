# Contact addresses

Contact addresses represent a certain physical location that can be tied to a contact
as either a localised or internationalised address.

!!! info
    What's the difference? Internationalised addresses are generally required to stick to
    characters that can be mapped to 7-bit US-ASCII, whereas localised addresses can
    *generally* (and it's a big generally) contain any valid UTF-8.
    
    
## Example object

```json
{
    "url": "https://domains.glauca.digital/api/contact_addresses/908b1a1b-e452-4c87-a711-1ab3e8e61c50/",
    "id": "908b1a1b-e452-4c87-a711-1ab3e8e61c50",
    "description": "Barbara Davis",
    "name": "Barbara Davis",
    "organisation": "Example Organisation",
    "street_1": "5 Test Street",
    "street_2": null,
    "street_3": null,
    "city": "Test City",
    "province": "Testshire",
    "postal_code": "TE57 1NG",
    "country_code": "GB",
    "birthday": null,
    "identity_number": null,
    "disclose_name": false,
    "disclose_organisation": false,
    "disclose_address": false
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

### `description`
An arbitrary description to help users identify the object. Not sent to the registry.

### `name`
The name of a person department at the address. Generally registries want to have 
`<first name> <last name>`, but we're not fussy, we'll accept anything here.

### `organisation`
> Nullable

The organisation at the address.

### `street_1`
The first line of the address.

### `street_2`
> Nullable

The second line of the address.

### `street_3`
> Nullable

The third line of the address.

### `city`
The city of the address.

### `province`
> Nullable

The province/state of the address.

### `postal_code`
> Nullable

The postal code of the address. Required for addresses in the UK and Crown territories.

### `country_code`

The ISO 3166-1 alpha-2 code of the country of the address.

### `birthday`
> Nullable

The person's birthday as ISO 8601 date. Sometimes required for `.fi` registrations

### `identity_number`
> Nullable

The person's identity number as a string. Sometimes required for `.fi` registrations

### `disclose_name`
Boolean on weather to disclose the object's name in WHOIS.

### `disclose_organisation`
Boolean on weather to disclose the objects's organisation in WHOIS.

### `disclose_address`
Boolean on weather to disclose the objects address in WHOIS.
  
## List contact addresses

Required scopes:

- `domains:contact_address.read`
- OR `domains.contact_address` 

```http
GET /api/contact_addresses/ HTTP/1.1
```
  
## Retrieve a contact addresses

Required scopes:

- `domains:contact_address.read`
- OR `domains.contact_address` 

```http
GET /api/contact_addresses/<object_id>/ HTTP/1.1
```
  
## Create a contact addresses

Required scopes:

- `domains.contact_address` 

```http
POST /api/contact_addresses/ HTTP/1.1
Content-Type: application/json

{
    "description": "...",
    "name": "...",
    ...
}
```
  
## Update a contact addresses

Required scopes:

- `domains.contact_address` 

### For a complete replacement

```http
PUT /api/contact_addresses/<object_id>/ HTTP/1.1
Content-Type: application/json

{
    "description": "...",
    "name": "...",
    ...
}
```

### To update a few fields only

```http
PATCH /api/contact_addresses/<object_id>/ HTTP/1.1
Content-Type: application/json

{
    "disclose_name": true
}
```
  
## Delete a contact addresses

Required scopes:

- `domains.contact_address` 

```http
DELETE /api/contact_addresses/<object_id>/ HTTP/1.1
```