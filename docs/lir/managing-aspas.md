# Managing ASPAs

When you got your ASN from us you also got an IPv6 prefix to go with it.
Even though you got both resources assigned to you only the prefix
shows up on [rpki.glauca.digital](https://rpki.glauca.digital/); this is
because the ASN is classed as a Provider Independent (PI) resource and
is delegated directly to you by the RIPE NCC.

In order to manage ASPAs you'll need to add the RIPE NCC as a parent to 
your RPKI CA with us. The steps to do this are as follows:

1. Go to [rpki.glauca.digital](https://rpki.glauca.digital/) and login.
2. Open the CA you want to add ASN to.
3. Click on the 'Parents' link.
4. Click on 'Download child request' - you'll need this file later.
5. Go to the [RIPE NCC portal](https://my.ripe.net/).
6. Click on 'RPKI' on the left hand side.
7. Make sure you have the correct organisation selected.
8. Select 'Delegated' for the type of CA to create.
9. Click on 'I accept'.
10. Upload your child request file downloaded earlier.
11. Click on 'Download this server's identity xml file'
12. Go back to [rpki.glauca.digital](https://rpki.glauca.digital/) and click on 'Upload parent response'.
13. Upload the file you downloaded from the RIPE NCC portal.

Once you've done this you'll be able to manage your ASPAs for the ASNs assigned
to you by the RIPE NCC.