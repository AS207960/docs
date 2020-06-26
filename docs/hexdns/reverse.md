# Reverse DNS zones

If you're lucky enough to have an allocation of IP addresses from one of the RIRs
(Regional Internet Registries), then you can use HexDNS to serve the reverse DNS for
that allocation.

Zone creation for reverse zones is a manual process (since we don't expect many people
to take advantage of it), so please contact us to setup reverse delegation.

## Automatically serve reverse PTR records

If your account controls both the forward and reverse delegation then you can select
this option to automatically serve requests for `PTR` records that match your forward
address records without having to duplicate information.