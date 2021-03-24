# Dynamic DNS

HexDNS supports dynamic DNS compatible with the `dyndns2` protocol.

To create a dynamic record navigate to the zone page and create a new record under
'Dynamic address records'. Once the zone is created click the edit button on it to view
it's ID and password. 

For the purposes of `dyndns2` the record ID (a UUID) is your username and the password
is well the password. 

If you're not using a `dyndns2` compatible client you can make a GET/POST request to
`https://{id}:{password}@dns.glauca.digital/nic/update?hostname={fqdn}[&myip={v4/v6 addr}]`
to update the record (you'll need to make two requests to update the IPv4 and IPv6 
address, the 1st with the v4 address and the 2nd with the v6 address)

## Check IP service

Making a GET request to `https://dns.glauca.digital/checkip` will return the IP that the
request came from as the sole contents of the body.

## ddclient example config

When using the ever popular ddclient a configuration similar to the following should work,
where values in angle brackets (`<>`) denote where you have to update.

```text
use=web, web=dns.glauca.digital/checkip
protocol=dyndns2
server=dns.glauca.digital
login=<your id>
password=<your password>
<your-fqdn>
```
