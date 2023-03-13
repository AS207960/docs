# Secondary DNS / AXFR
Often called slave servers (but we don't like that term)

You can setup HexDNS to clone a zone from a primary server and server that as a secondary zone.

Make sure to add our IPs to the ACL on the primary server and through any firewalls:

- `2001:678:fc8:2::8/125`
- `45.129.95.0/24`

!!! tip
    If your servers support IPv6 we won't make any attempt to connect over IPv4.
    You'll therefore only need to allow the small `/125` IPv6 range through your ACL.