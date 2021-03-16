# CDS Records

HexDNS will automatically publish CDS records to instruct the parent zone
to setup DNSSEC records for a secure delegation. CDS requires explicit support
by the parent zone.

More details on how CDS works are available [on the domains docs](/domains/cds/).

## Manage CDS records

!!! info
    This is a beta feature. We're still working on it, but we feel it is
    complete enough to let people try it out. Don't expect perfection just yet.

Sometimes you'll want to change DNS provider. Changing DNSSEC during
this can be a pain. 

### Moving to HexDNS

If you're moving from another provider that supports DNSSEC to HexDNS you can
add the old DS and DNSKEY records to ensure the old DS records say in the
parent until the changeover is done.

If you're moving from another provider that does not support DNSSEC to HexDNS
you can disable CDS until the changeover is complete to ensure DNSSEC does not 
break.

### Moving from HexDNS

If you're moving to a provider that doesn't support DNSSEC or doesn't support
a proper CDS rollover you can use the `Disable CDS` button to tell the parent
zone to remove its DS records. Your zone will remain signed by HexDNS, meaning
you'll never have broken DNSSEC.

If you're moving to a provider that does support DNSSEC rollover you can add the
DS and DNSKEY records from the new provider to HexDNS to be published along with
HexDNS's DS and DNSKEY records. The HexDNS records can't be unpublished when
this mode is used, so the HexDNS records will remain in the parent until the
name servers are changed over.
