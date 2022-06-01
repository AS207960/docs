# Registering a domain name

This guide will show you how to register and setup a domain name with the API.

!!! info
    This will require an access token with the `domains:contact`, `domains:contact_address`,
    `domains:domain` and `domains:domain.create` scopes.
    
## Create a contact

Every domain needs at least a registrant contact, let's create one. First we need a address
for the contact. We'll only create a localised address but you can create an internationalised
address too.

```http
POST /api/contact_addresses/ HTTP/1.1
Authorization: Bearer <your token>
Content-Type: application/json; charset=utf-8
Accept: application/json

{
    "description": "Example Address",
    "name": "Barry Benson",
    "organisation": "The Honey Factory",
    "street_1": "5 Buzz Street",
    "street_2": null,
    "street_3": null,
    "city": "Some City",
    "province": "Flyshire",
    "postal_code": "TE57 1NG",
    "country_code": "GB",
    "disclose_name": true,
    "disclose_organisation": false,
    "disclose_address": false
}
```

The server should return the object we just created if all is well.

```http
HTTP/1.1 200 OK
Content-Type: application/json
Vary: Accept

{
    "url": "https://domains.glauca.digital/api/contact_addresses/908b1a1b-e452-4c87-a711-1ab3e8e61c50/",
    "id": "908b1a1b-e452-4c87-a711-1ab3e8e61c50",
    "description": "Example Address",
    "name": "Barry Benson",
    "organisation": "The Honey Factory",
    "street_1": "5 Buzz Street",
    "street_2": null,
    "street_3": null,
    "city": "Some City",
    "province": "Flyshire",
    "postal_code": "TE57 1NG",
    "country_code": "GB",
    "birthday": null,
    "identity_number": null,
    "disclose_name": true,
    "disclose_organisation": false,
    "disclose_address": false
}
```

Make a note of this ID, we'll need it in the next step. Which is to create the contact.
Use this ID in the `local_address` field.

```http
POST /api/contacts/ HTTP/1.1
Authorization: Bearer <your token>
Content-Type: application/json; charset=utf-8
Accept: application/json

{
    "description": "Example contact",
    "local_address": "908b1a1b-e452-4c87-a711-1ab3e8e61c50",
    "int_address": null,
    "phone": "+441234567890",
    "phone_ext": null,
    "fax": null,
    "fax_ext": null,
    "email": "b.benson@honey.co.uk",
    "entity_type": "uk_limited_company",
    "trading_name": null,
    "company_number": "12345678",
    "disclose_phone": false,
    "disclose_fax": false,
    "disclose_email": true
}
```

And again the object will be sent back to us.

```http
HTTP/1.1 200 OK
Content-Type: application/json
Vary: Accept

{
    "url": "https://domains.glauca.digital/api/contacts/2a2b0972-a64d-42e2-a401-b09595306e5d/",
    "id": "2a2b0972-a64d-42e2-a401-b09595306e5d",
    "description": "Example contact",
    "local_address": "908b1a1b-e452-4c87-a711-1ab3e8e61c50",
    "local_address_url": "https://domains.glauca.digital/api/contact_addresses/908b1a1b-e452-4c87-a711-1ab3e8e61c50/",
    "int_address": null,
    "int_address_url": null,
    "int_address": null,
    "phone": "+441234567890",
    "phone_ext": null,
    "fax": null,
    "fax_ext": null,
    "email": "b.benson@honey.co.uk",
    "entity_type": "uk_limited_company",
    "trading_name": null,
    "company_number": "12345678",
    "disclose_phone": false,
    "disclose_fax": false,
    "disclose_email": true
}

```

## Registering the domain

Now we have everything setup to register the domain. First lets check the domain we want
is available to register.

```http
POST /api/domains/check/ HTTP/1.1
Authorization: Bearer <your token>
Content-Type: application/json; charset=utf-8
Accept: application/json

{
    "domain": "honey.li",
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
    "domain": "honey.li",
    "available": true,
    "reason": null,
    "price": "9.99"
}
```

Excellent! It's available, let's register it. To do this we'll need to create a 
domain registration order. We're setting this to be an 'off session' order so it'll fail
if there isn't enough money in your account with us.

```http
POST /api/domain_registration_orders/ HTTP/1.1
Authorization: Bearer <your token>
Content-Type: application/json; charset=utf-8
Accept: application/json

{
    "domain": "honey.li",
    "period": {
        "unit": "y",
        "value": 1
    },
    "off_session": true,
    "registrant": "2a2b0972-a64d-42e2-a401-b09595306e5d"
}
```

This will be sent back to us in the `started` state. 

```http
HTTP/1.1 200 OK
Content-Type: application/json
Vary: Accept

{
    "url": "https://domains.glauca.digital/api/domain_registration_orders/4717d5b5-16e0-461d-8d9d-650bc03e7a5c/",
    "id": "4717d5b5-16e0-461d-8d9d-650bc03e7a5c",
    "redirect_uri": null,
    "last_error": null,
    "off_session": true,
    "price": 9.99,
    "state": "started",
    "domain": "honey.li",
    "domain_id": "631a9f98-6f20-45a0-9468-d599f318133a",
    "domain_obj": null,
    "domain_obj_url": null,
    "registrant": "2a2b0972-a64d-42e2-a401-b09595306e5d",
    "registrant_url": "https://domains.glauca.digital/api/contacts/2a2b0972-a64d-42e2-a401-b09595306e5d/",
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

The order will then be processed in the background and assuming everything went well it'll
transition to the `completed` state and the `domain_obj` field will be populated.

```http
GET /api/domain_registration_orders/4717d5b5-16e0-461d-8d9d-650bc03e7a5c/ HTTP/1.1
Authorization: Bearer <your token>
Content-Type: application/json; charset=utf-8
Accept: application/json
```

```http
HTTP/1.1 200 OK
Content-Type: application/json
Vary: Accept

{
    "url": "https://domains.glauca.digital/api/domain_registration_orders/4717d5b5-16e0-461d-8d9d-650bc03e7a5c/",
    "id": "4717d5b5-16e0-461d-8d9d-650bc03e7a5c",
    "redirect_uri": null,
    "last_error": null,
    "off_session": true,
    "price": 9.99,
    "state": "completed",
    "domain": "honey.li",
    "domain_id": "631a9f98-6f20-45a0-9468-d599f318133a",
    "domain_obj": "631a9f98-6f20-45a0-9468-d599f318133a",
    "domain_obj_url": "https://domains.glauca.digital/api/domains/631a9f98-6f20-45a0-9468-d599f318133a",
    "registrant": "2a2b0972-a64d-42e2-a401-b09595306e5d",
    "registrant_url": "https://domains.glauca.digital/api/contacts/2a2b0972-a64d-42e2-a401-b09595306e5d/",
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

## Setting up the domain

If we check the newly registered domain it should look something like this.

```http
GET /api/domains/631a9f98-6f20-45a0-9468-d599f318133a/ HTTP/1.1
Authorization: Bearer <your token>
Content-Type: application/json; charset=utf-8
Accept: application/json
```

```http
HTTP/1.1 200 OK
Content-Type: application/json
Vary: Accept

{
    "url": "https://domains.glauca.digital/api/domains/631a9f98-6f20-45a0-9468-d599f318133a/",
    "id": "631a9f98-6f20-45a0-9468-d599f318133a",
    "domain": "honey.li",
    "statuses": [
        "ok"
    ],
    "deleted": false,
    "registrant": "2a2b0972-a64d-42e2-a401-b09595306e5d",
    "registrant_url": "https://domains.glauca.digital/api/contacts/2a2b0972-a64d-42e2-a401-b09595306e5d/",
    "admin_contact": null,
    "admin_contact_url": null,
    "billing_contact":  null,
    "billing_contact_url": null,
    "tech_contact": null,
    "tech_contact_url": null,
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
    "sec_dns": null,
    "created": null,
    "expiry": "2020-08-23T21:59:59Z",
    "last_updated": null,
    "last_transferred": null
}
```

Let's say we don't want to use HexDNS and want to setup another DNS server (no hard feelings,
honest). We'll patch the domain to set new name servers.

```http
PATCH /api/domains/631a9f98-6f20-45a0-9468-d599f318133a/ HTTP/1.1
Authorization: Bearer <your token>
Content-Type: application/json; charset=utf-8
Accept: application/json

{
    "name_servers": [
        {
            "host_object": "ns1.he.net",
            "host_name": null,
            "addresses": null
        },
        {
            "host_object": "ns2.he.net",
            "host_name": null,
            "addresses": null
        }
    ]
}
```

For more information on what's available to change on the domain see the
[domain object reference](/domains/api/objects/domains/)
