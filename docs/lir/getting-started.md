# Getting started

You've just got your ASN from us; great! But where next?

## RIPE Database

The primary way for you to manage your internet resources is through the 
RIPE database. Here you can create objects which define your routing
procedure etc, defined in a language called RPSL.
The most important one to create is a `route` / `route6` for your new ASN.
This tells other networks that your ASN will originate your prefix.

The RIPE DB can be accessed at [apps.db.ripe.net](https://apps.db.ripe.net).
The first time you go to manage resources you'll need to create a RIPE NCC
Access account. This is completely free of charge.

More training on the RIPE DB is available on
[the RIPE academy](https://academy.ripe.net).

Below are some example useful/important DB objects;

### `route6`

```rpsl
route6: 2a0e:1cc1::/48
origin: AS207960
mnt-by: AS207960-MNT
org: ORG-AC192-RIPE
source: RIPE
```

### `domain`

Use this object to configure reverse DNS on your prefix. 

[HexDNS](https://dns.glauca.digital/reverse/) supports reverse zones if
you'd like to use it for your prefix.
Drop us an email at [hello@glauca.digital](mailto:hello@glauca.digital) and
we'll set it up for you. If you're using HexDNS please set `zone-c`
to `AN31887-RIPE`.

```rpsl
domain: 0.0.0.0.1.c.c.1.e.0.a.2.ip6.arpa
nserver: ns1.as207960.net
nserver: ns2.as207960.net
admin-c: AN31887-RIPE
tech-c: AN31887-RIPE
zone-c: AN31887-RIPE
ds-data: 6687 13 2 ...
mnt-by: AS207960-MNT
org: ORG-AC192-RIPE
source: RIPE
```

## RPKI

We offer two options for RPKI; we can either setup RPKI for you, running on
our RPKI infrastructure. You'll need to email us for every update to ROAs.
We can also create a delegation from our server to your RPKI CA. You'll
be able to use our server as a publication repository, so you won't have 
to run that yourself if you don't have one already.

**We strongly recommend that you configure RPKI** to ensure the security
of your announcements.

### Hosted RPKI

Email us at [hello@glauca.digital](mailto:hello@glauca.digital) with the
details of ROAs to be created/updated/deleted. Please include the origin
ASN, prefix, and max announcement length in your request. You'll also need
to authenticate your ticket to your SSO account to ensure the security of
RPKI.

### Delegated RPKI

Email us at [hello@glauca.digital](mailto:hello@glauca.digital) with your
RFC8183 `child_request` message. We'll supply an RFC8183 `parent_response`
for you to input into your RPKI CA. You'll also need to authenticate your
ticket to your SSO account to ensure the security of RPKI.

If you'd like to use our publication reposity we'll also need your RFC8183
`publisher_request`. We'll supply an RFC8183 `reposity_response`.

Your `child_request` should look something like the below;

```xml
<child_request xmlns="http://www.hactrn.net/uris/rpki/rpki-setup/" version="1" child_handle="Bob">
  <child_bpki_ta>
    R29kIGlzIHJlYWwgdW5sZXNzIGRlY2xhcmVkIGludGVnZXI=
  </child_bpki_ta>
</child_request>
```
and your `publisher_request` should look like the below;

```xml
<publisher_request xmlns="http://www.hactrn.net/uris/rpki/rpki-setup/" version="1" tag="A0001" publisher_handle="Bob">
  <publisher_bpki_ta>
    R29kIGlzIHJlYWwgdW5sZXNzIGRlY2xhcmVkIGludGVnZXI=
  </publisher_bpki_ta>
</publisher_request>
```

## IXP VMs

Whilst we don't offer VMs ourselves, our good friends over at iFog offer VMs
with IXP access links. These are a great way to get a feel for how an IXP
works without the large cost of physically connecting to an IXP.

[Order yours here](); from 9CHF a month.

## Glossary

### IXP

**Internet Exchange Point** - A neutral networking place over which many
networks can peer.

### RPKI

**Resource Public Key Infrastructure** - Cryptographic security for BGP 
announcements.

### ROA
**Route Origin Authorization** - RPKI objects that state which ASN is
allowed to announce which prefix.
