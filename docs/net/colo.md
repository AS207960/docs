# Colocation

## BGP

BGP is available to customers who have colo space with us. We operate AS202359.

Please contact us to have this enabled for you.

Further information reguarding our BGP services can be found [here](index.md).

## DNS Server

We operate a DNS server for available to users of colo or services hosted inside.

- `193.3.165.1` 
- `2a11:f2c0:1:100::1`

As a BGP customer, We will add your prefixes to the allowed list. You can then use the DNS server to resolve DNS records.

This DNS server forwards DNS queries to:

- [Cloudflare DNS](https://cloudflare-dns.com) - Unfiltered
- [Google DNS](https://developers.google.com/speed/public-dns) - Unfiltered
- [quad9 DNS](https://www.quad9.net) - Unfiltered
- [Control D DNS](https://controld.com) - Unfiltered

## NetBoot

We operate a NetBoot server on the management network. This is available to all users of colo space.

Setup your server to PXE boot from the management network to use this to install various OSes and boot live systems.

If you run your own DHCP you can setup your DHCP server to provide `45.129.95.245` port `69` 
as the TFTP server address.

### ISC DHCP

If using the the ISC DHCP server you can add the following to your configuration,
this will also add support for UEFI PXE boot:

```
option arch code 93 = unsigned integer 16;
option tftp-server-name "45.129.95.254";
next-server 45.129.95.245;
if exists user-class and ( option user-class = "iPXE" ) {
  filename "http://netboot.as207960.ltd.uk/boot/menu.ipxe";
} elsif option arch = encode-int ( 16, 16 ) {
  filename "http://netboot.as207960.ltd.uk/boot/ipxe/netboot.xyz.efi";
  option vendor-class-identifier "HTTPClient";
} elsif option arch = 00:07 {
  filename "netboot.xyz.efi";
} else {
  filename "netboot.xyz.kpxe";
}
```

### Missing images

If you encounter an error booting your image of choice we may not have it cached on our server yet.
Please contact us and we will arrange for it to be added to our cache.