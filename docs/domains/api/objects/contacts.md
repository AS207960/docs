# Contacts

Contacts are a representation of a specific department or person responsible for certain
or all aspects of a domain's management.
    
## Example object

```json
{
    "url": "https://domains.glauca.digital/api/contacts/2a2b0972-a64d-42e2-a401-b09595306e5d/",
    "id": "2a2b0972-a64d-42e2-a401-b09595306e5d",
    "description": "Barbara Davis",
    "local_address": "5bdb8e9d-f609-4ffc-bdeb-1d64fed2841b",
    "local_address_url": "https://domains.glauca.digital/api/contact_addresses/5bdb8e9d-f609-4ffc-bdeb-1d64fed2841b/",
    "int_address": null,
    "int_address_url": null,
    "phone": "+441234567890",
    "phone_ext": null,
    "fax": null,
    "fax_ext": null,
    "email": "barbara.davis@example.net.uk",
    "entity_type": "uk_limited_company",
    "trading_name": null,
    "company_number": "12345678",
    "disclose_phone": false,
    "disclose_fax": false,
    "disclose_email": false
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

### `local_address`
> Reference to a [contact address](/domains/api/contact_addresses/)

The localised address of this contact

### `local_address_url`
> Read only

The canonical URL of the localised address of this contact

### `int_address`
> Nullable

The internationalised address of this contact

### `int_address_url`
> Read only, nullable
>
> Reference to a [contact address](/domains/api/contact_addresses/)

The canonical URL of the internationalised address of this contact

### `phone`
> Nullable

The voice phone number of the contact, formatted in [E.164](https://en.wikipedia.org/wiki/E.164) format

### `phone_ext`
> Nullable

The extension number to the voice phone number. 

### `fax`
> Nullable

The fax phone number of the contact, formatted in [E.164](https://en.wikipedia.org/wiki/E.164) format

### `fax_ext`
> Nullable

The extension number to the fax phone number. 

### `email`
The email of the contact, in [RFC 5321](https://tools.ietf.org/html/rfc5321) format

### `entity_type`
The legal type of the entity to which this contact refers.
Valid values are;

* `not_set`
* `unknown_entity`
* `uk_limited_company`
* `uk_public_limited_company`
* `uk_partnership`
* `uk_sole_trader`
* `uk_limited_liability_partnership`
* `uk_industrial_provident_registered_company`
* `uk_individual`
* `uk_school`
* `uk_registered_charity`
* `uk_government_body`
* `uk_corporation_by_royal_charter`
* `uk_statutory_body`
* `uk_political_party`
* `other_uk_entity`
* `finnish_individual`
* `finnish_company`
* `finnish_association`
* `finnish_institution`
* `finnish_political_party`
* `finnish_municipality`
* `finnish_government`
* `finnish_public_community`
* `other_individual`
* `other_company`
* `other_association`
* `other_institution`
* `other_political_party`
* `other_municipality`
* `other_government`
* `other_public_community`

### `trading_name`
> Nullable

The trading name of the entity, if different from the legal name

### `company_number`
> Nullable

The number or identifier of the company in the relevant company register

!!! danger
    This field may be called a number but is a string data type, as not all company
    'numbers' are purely numeric.

### `disclose_phone`
Boolean on weather to disclose the object's voice number in WHOIS.

### `disclose_fax`
Boolean on weather to disclose the objects's fax number in WHOIS.

### `disclose_email`
Boolean on weather to disclose the object's email in WHOIS.
  
## List contacts

Required scopes:

- `domains:contact.read`
- OR `domains:contact` 

```http
GET /api/contacts/ HTTP/1.1
```
  
## Retrieve a contact

Required scopes:

- `domains:contact.read`
- OR `domains:contact` 

```http
GET /api/contacts/<object_id>/ HTTP/1.1
```
  
## Create a contact

Required scopes:

- `domains:contact` 

```http
POST /api/contacts/ HTTP/1.1
Content-Type: application/json

{
    "description": "...",
    "name": "...",
    ...
}
```
  
## Update a contact

Required scopes:

- `domains:contact` 

### For a complete replacement

```http
PUT /api/contacts/<object_id>/ HTTP/1.1
Content-Type: application/json

{
    "description": "...",
    "name": "...",
    ...
}
```

### To update a few fields only

```http
PATCH /api/contacts/<object_id>/ HTTP/1.1
Content-Type: application/json

{
    "disclose_fax": true
}
```
  
## Delete a contact addresses

Required scopes:

- `domains:contact` 

```http
DELETE /api/contacts/<object_id>/ HTTP/1.1
```