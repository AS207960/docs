# Registry lock

Registry lock is an additional service we offer to ensure absolute security of business critical domain names.

!!! info Registry lock is currently in a closed beta, so isn't available for most customers.

## Supported authenticators

Registry lock is authenticated by WebAuthN public key credentials.
We recommend using a different authenticator for your domain(s) than for
logging into your SSO account.

We restrict which authenticators can be used for registry lock to ensure
the upmost security of domains. The below list is what authenticators we
support. It may be expanded in the future subject to security checks.

* Apple Passkeys in iCloud Keychain (FaceID/TouchID)
* Android platform authenticators with an intact SafetyNet
* FIDO2 keys possessing FIDO Alliance certification level 1 or higher  
* U2F keys possessing FIDO Alliance certification level 1 or higher  

Keys which cannot attest to their security or are attested by an anonymization
CA will not be accepted.

## Supported TLDs

Only a few TLDs support registry lock, and of those we're only onboarded for registry lock in the below TLDs.

### Afilias TLDs

* .ac
* .archi
* .bet
* .bio
* .black
* .blue
* .college
* .global
* .green
* .info
* .io
* .kim
* .lgbt
* .llc
* .loto
* .mobile
* .organic
* .pet
* .pink
* .poker
* .pro
* .promo
* .red
* .sh
* .shiksha
* .ski
* .vote
* .voto

### Verisign TLDs

* .cc
* .com
* .name
* .net
* .tv


### SWITCH TLDs

* .ch
* .li

### CentralNIC TLDs

* .art
* .bar
* .design
* .fm
* .ink
* .love
* .protection
* .rent
* .rest
* .security
* .storage
* .theatre
* .tickets
* .wiki
* .xyz

### dotMe TLDs
 
* .me
