# Automatic DNSSEC provisioning

After you or your DNS operator has setup DNSSEC on the zone, DS records need to be inserted
into the parent zone (.com, .net, etc) to complete the chain of trust from the ICANN root
zone. This process can be annoying and prone to minor errors even with the ever handy
copy paste.

`CDS` and `CDNSKEY` records allow for automatic setup, rollover, and removal of DNSSSEC
delegation for a zone. These are identical copies of what the child zone wants in the parent,
hence Child DS and Child DNSKEY. We will poll the nameservers of all domains every hour
to detect these records and make any changes in the parent as requested by the records.

For the sneaky techy deets we implement this according to 
[RFC 7344](https://tools.ietf.org/html/rfc7433) and 
[RFC 8078](https://tools.ietf.org/html/rfc8078).

## Format of child records

Consider the following DS record in the parent zone:
```
website.example. 3600 IN DS 61301 13 2 FB7DF3397DB9AEA62EB81423CA1BB229CCAE3590DCBB16CE46C04D62B48DFB91
```

When the DS record of the new KSK is ready to be published in the parent zone, the child can
set the following record:
```
website.example. 3600 IN CDS 45224 13 2 8A7BD58EF0CFA7FFD3813B28A288C69DE9D38D3B5FE71816E82AE26AF0615165
```

Once this has been picked up the new DS in the parent zone will be:
```
website.example. 3600 IN DS 45224 13 2 8A7BD58EF0CFA7FFD3813B28A288C69DE9D38D3B5FE71816E82AE26AF0615165
```

A chhild zone can also signal to turn off DNSSEC by publishing a special CDS record with an 
algorithm of 0, as follows:
```
website.example. 3600 IN CDS 0 0 0 00
```

The procedure is identical for `CDNSKEY`, but with the `DS` data swapped out for `DNSKEY` data.
Some zones (notably .de) require to be sent `DNSKEY` data rather than `DS` data and compute
the `DS` record themselves. For this reason it is advisable to publish both `CDS` and 
`CDNSKEY` and the appropriate one will be used.

## Criteria for acceptance into parent zone

Before records are accepted into the parent zone a few criteria must be met.
This are as follows:

- Every name server must respond on every listed IP address over TCP with identical CDS sets.
- If the zone is already signed with DNSSEC the CDS record set must be singed by the current
published DS/DNSKEY record set.
- CDS/CDNSKEY must use a supported algorithm and digest type;
    * algorithms: 5, 7, 8, 10, 13, 14, 15, 16, 0
    * digest types: 1, 2, 4, 0
- The zone must validate with the new CDS set.

## Post acceptance

Once we've received the request, validated, and successfully enacted upon it, we'll send you
an email with a summary of what DS/DNSKEY records have been added/removed.