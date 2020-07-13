# Associated host objects (glue records)

Host objects, or often also referred to as glue records allow you to put the IPv4/IPv6 address
of a DNS server in the registry's DNS server if your DNS server is on the same domain it is
authoritative for.

As an example consider our own zone `as207960.net`. Its name servers are:

- `ns1.as207960.net`
- `ns2.as207960.net`

These are hosted on the same zone as they need to answer for, that is to ask `ns1.as207960.net`
what the address of `as207960.net` is you'll already need to know the address of `ns1.as207960.net`.

The solution to this is host objects, such that when someones queries `.net` for `as207960.net`,
the `.net` servers will return along with the answer additional data to say "Hey, you'll probably
need to know this IP address to query further".