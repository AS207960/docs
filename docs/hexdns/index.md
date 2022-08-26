# HexDNS Overview

The HexDNS control panel can be accessed at [dns.glauca.digital](https://dns.glauca.digital)

Get started [here](/hexdns/setup/)

## Pricing

For the first X zones | Price per zone per month
----------------------|-------------------------
3                     | 0.00 GBP
Above 3               | 1.00 GBP

Plus EU VAT where applicable.

## Supported record types

- `A`
- `AAAA`
- `CNAME`
- [`ANAME`](/hexdns/aname/) (often called `ALIAS`)
- `MX`
- `NS`
- `TXT`
- `SRV`
- `CAA`
- `NAPTR`
- `SSHFP`
- [`DS`](/hexdns/dnssec/)
- `LOC`
- `HINFO`
- `RP`

## Address records

`A` and `AAAA` records are both stored as `Address` record types in the control panel,
and the server will server the IPv4 or IPv6 records as requested by the client.

!!! info "Automatically serve PTR records? WTF?"
    See [reverse DNS](/hexdns/reverse/)

## Other features

- [Dynamic DNS](/hexdns/dyndns/)
- [DNSSEC as standard](/hexdns/dnssec/)
- [CDS](/hexdns/cds/)