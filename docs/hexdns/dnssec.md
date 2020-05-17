# DNSSEC

All zones created in HexDNS have DNSSEC enabled by default.
There's no need to worry if you don't want to configure DNSSEC, simply don't
create the DS records and HexDNS will be treated as an 'island of security' and as if
there was no DNSSEC in the first place.

However if you do want DNSSEC the relevant details are at the top the zone page.
We use ECDSA (algorithm 13) which isn't strictly required by the DNSSEC spec,
so if your registrar doesn't support algorithm 13 please tell us and we'll talk
to them to figure something out.

!!! info
    Some providers require the DS record in zone file format. For HexDNS that will be:
    `<tag> 13 2 <digest>`

!!! tip
    If you want to check that DNSSEC is configured correctly 
    [DNSViz](https://dnsviz.net/) is a great tool for that (also makes pretty graphs).

If you want to sub-delegate from your zone on HexDNS to another nameserver with DNSSEC,
you'll need to create DS records in HexDNS. The relevant table is at the bottom of the
zone page.