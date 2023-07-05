# AXFR out of HexDNS

HexDNS allows you to setup a secondary server (sometimes called a slave server)
to AXFR (zone transfer) from HexDNS as the primary.

Point your secondary server at `axfr.as207960.net` to receive the zone transfer.

You'll need to setup either a TSIG key or an IP based ACL within HexDNS to allow this.

!!! tip
    If you're using a TSIG key you don't also need to setup an IP ACL. HexDNS will
    accept AXFR requests from any IP if the TSIG key is valid.

!!! note
    We don't support IXFR (incremental zone transfers), only AXFR.

## TSIG key algorithms

We support the following TSIG key algorithms:

- HMAC SHA-224
- HMAC SHA-256
- HMAC SHA-384
- HMAC SHA-512
- HMAC SHA-512/256

## Notify

At the moment HexDNS won't sign NOTIFY messages with a TSIG key.

NOTIFY messages will come from one of the following addresses:

- `2001:678:fc8:2::10/125`
- `45.129.95.0/24`

!!! tip
    If your servers support IPv6 we won't make any attempt to connect over IPv4.
    You'll therefore only need to allow the small `/125` IPv6 range through your ACL.