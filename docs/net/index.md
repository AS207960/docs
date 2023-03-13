# Network details

## ASNs
- AS207960 (Primary ASN)
- AS202359 (Transit)

## Looking glass
[lg.as207960.net](https://lg.as207960.net)

## Public RPKI RTR server

RTR protocol (TCP): `rtr.routinator.as207960.net:3323`  
RTR protocol (TLS): `rtr.routinator.as207960.net:3324`  
Web UI: [routinator.as207970.net](https://routinator.as207960.net)

## BGP communities
`net` here means our ASN (i.e. 207960 or 202359)

- `net:1:0` - received from transit
- `net:1:1` - received from peering
- `net:1:2` - received from downstream
- `net:1:3` - received from route servers
- `net:2:x` - received from AS x