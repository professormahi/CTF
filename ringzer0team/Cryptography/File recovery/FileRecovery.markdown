#####[File recovery](http://ringzer0team.com/challenges/49)
#####Answer

Unarchive file after downloading:
```
  $ tar xvf c96ac47d3b5c62b67219113fe6524122.tar
  flag/
  flag/private.pem
  flag/flag.enc
  $ cd flag/
  $ ls
  flag.enc  private.pem
  $ file private.pem
  private.pem: PEM RSA private key
```  
So these files are related to RSA algorithm, We must decrypt `flag.enc` with ket `private.pem`.
```
  $ openssl rsautl -decrypt -in flag.enc -out ciphertext -inkey private.pem // Result of decryption is in ciphertext
  $ cat ciphertext
  FLAG-vOAM5ZcReMNzJqOfxLauakHx
```
So flag is `FLAG-vOAM5ZcReMNzJqOfxLauakHx`.

Be calm and capture the flag. ;)