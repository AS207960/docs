# Adding your zone to HexDNS

To add your zone to HexDNS login to the control panel [here](https://dns.glauca.digital),
and follow the zone creation wizard. You won't be able to create a zone if someone else
already controls a more generic zone.

Once the zone is created set the nameservers on the parent to:

- `ns1.as207960.net`
- `ns2.as207960.net`
- `ns3.as207960.net`
- `ns4.as207960.net`

You may also want to configure [DNSSEC](/hexdns/dnssec/)

## White-label nameservers

If you'd like to use branded NS records for HexDNS you will need to setup A/AAAA records
from your custom nameserver record to:

- `45.129.95.255` / `2a0e:1cc1:1::1:1`
- `45.129.95.251` / `2a0e:1cc1:1::1:e`
- `194.58.196.32` / `2a01:3f1:832::53`
- `185.42.137.98` / `2a01:3f0:400::32`

These are the anycast IPv4 and IPv6 addresses of HexDNS. Once you have your custom records
setup you can add them as white-label nameservers in the HexDNS control panel.
