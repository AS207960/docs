# RFC 2136 Dynamic Updates Overview

HexDNS supports updates to the zone via DNS UPDATE messages (as defined in [RFC2136](https://tools.ietf.org/html/rfc2136)).

All update requests to HexDNS must be signed with TSIG. TSIG secrets can be managed be clicking the
`Edit update secrets` button on the zone page.

The supported HMAC algorithms are:

* `hmac-md5.sig-alg.reg.int.`
* `hmac-sha1.`
* `hmac-sha256.`
* `hmac-sha384.`
* `hmac-sha512.`


!!! danger
    We'll honour whatever HMAC is used te sign the incoming request for the response, however SHA1 is
    **strongly** advised against, and MD5 doubly so.