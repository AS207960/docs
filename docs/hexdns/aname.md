# ANAME Records

If you'd like to alias the address records for a domain (that is `A` and `AAAA`) to another
domain without using a full `CNAME` record (thereby redirecting TXT and other record types),
you can use a `ANAME` record.

With a `ANAME` record our servers will lookup the address of the alias and return that 
as the authoritative answer for address queries of the `ANAME`.

Consider the following zone
file:

```dns
example.com IN  A       1.2.3.4
example.com IN  TXT     "test"
example.org IN  ALIAS   example.com
example.org IN  TXT     "test2"
example.net IN  ALIAS   exmaple.com
example.gov IN  CNAME   example.com
```

The following results will be returned:

* `example.com IN A` will return `1.2.3.4`
* `example.com IN TXT` will return `"test"`
* `example.org IN A` will return `1.2.3.4`
* `example.org IN TXT` will return `"test2"`
* `example.net IN A` will return `1.2.3.4`
* `example.net IN TXT` will return nothing
* `example.gov IN A` will return `1.2.3.4`
* `example.gov IN TXT` will return `"test"`