##### [File recovery](http://ringzer0team.com/challenges/49)
##### Answer

To create the `Public key` we can use `openssl rsa`:  
```
$ echo "The Private Key" > id_rsa
$ openssl rsa -in id_rsa -pubout
writing RSA key
-----BEGIN PUBLIC KEY-----
MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDwkrxVrZ+KCl1cX27SHDI7Efgn
FJZ0qTHUD6uEeSoZsiVkcu0/XOPbz1RtpK7xxpKMSnH6uDc5On1IEw3A127wW4Y3
Lqqwcuhgypd3Sf/bH3z4tC25eqr5gA1sCwSaEw+yBxdnElBNOXxOQsST7aZGDyIU
tmpouI1IXqxjrDx2SQIDAQAB
-----END PUBLIC KEY-----
```
So we submit the public key and the flag will appear:  
```
FLAG-9869O2dQ43d1r116kfD0Sj5n
```

Have a fun flag capturing. ;)
