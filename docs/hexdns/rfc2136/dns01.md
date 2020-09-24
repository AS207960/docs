# DNS01 ACME Verification

TSIG keys can be limited to only allow modifications to the TXT records required for ACME DNS01
verification of domains (for example for Let's Encrypt wildcard certificates).

## certbot-dns-rfc2136

The certbot-dns-rfc2136 plugin can be used for DNS01 verification with HexDNS.

The config file for this plugin should be formatted as follows;

```ini
dns_rfc2136_server = 45.129.95.255
dns_rfc2136_port = 53
dns_rfc2136_name = <your key record name> (such as hexdns_zoneupdatesecret_bla.zone.example.)
dns_rfc2136_secret = <your secret> (in base64 form)
dns_rfc2136_algorithm = HMAC-SHA512
```

The `--dns-rfc2136-propagation-seconds` command line flag should be set to ~60 seconds.

Further documentation on this plugin can be found [here](https://certbot-dns-rfc2136.readthedocs.io/en/stable/).
