# Network details

## ASNs
- AS207960 (Primary ASN)
- AS202359 (Transit)

## Looking glass
[lg.as207960.net](https://lg.as207960.net)

## Public RPKI RTR server

RTR protocol (TCP): `rtr.routinator.as207960.net:3323` / `[2a0e:1cc1:1::1:15]:3323`  
RTR protocol (TLS): `rtr.routinator.as207960.net:3324` / `[2a0e:1cc1:1::1:15]:3324`  
Web UI: [routinator.as207970.net](https://routinator.as207960.net)

## BGP communities
`net` here means our ASN (i.e. 207960 or 202359)

- `net:1:0` - received from transit
- `net:1:1` - received from peering
- `net:1:2` - received from downstream
- `net:1:3` - received from route servers
- `net:2:x` - received from AS x

### Control communities
We accept the following control communities on routes announced to us.

- Peer specific
  - `net:10:peer` - do not announce to `peer`
  - `net:11:peer` - prepend once to `peer`
  - `net:12:peer` - prepend twice to `peer`
  - `net:13:peer` - prepend thrice to `peer`
- Region based
  - `net:20:region` - do not announce in `region`
  - `net:21:region` - prepend once in `region`
  - `net:22:region` - prepend twice in `region`
  - `net:23:region` - prepend thrice in `region`
- Everyone
  - `net:10:0` - do not announce to anyone
  - `net:11:0` - prepend once to everyone
  - `net:12:0` - prepend twice to everyone
  - `net:13:0` - prepend thrice to everyone

#### Regions

- `1` - Frankfurt
- `2` - Leeds
- `3` - London