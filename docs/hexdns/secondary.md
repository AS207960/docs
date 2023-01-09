# Secondary DNS / AXFR
Often called slave servers (but we don't like that term)

You can setup HexDNS to clone a zone from a primary server and server that as a secondary zone.

!!! tip
    Whilst our secondary server supports serving DNSSEC records (if they're in the primary zone),
    we don't support NSEC3, so you'll either need to use NSEC or convince us to program in NSEC3 support.

Make sure to add our IPs to the ACL on the primary server and through any firewalls:

- `2001:678:fc8:2::8/125`
- `45.129.95.0/24`
